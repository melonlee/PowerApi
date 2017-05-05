package powerapi.web.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import org.springframework.amqp.core.AmqpTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import powerapi.common.utils.DateFormatUtil;
import powerapi.common.utils.HttpUtil;
import powerapi.common.utils.JsonUtil;
import powerapi.dto.RequestDto;
import powerapi.entity.AutoTest;
import powerapi.entity.Function;
import powerapi.entity.Project;
import powerapi.entity.UnitTest;
import powerapi.service.AutoTestService;
import powerapi.service.FunctionService;
import powerapi.service.ProjectService;
import powerapi.service.UnitTestService;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;

/**
 * Created by Melon on 17/3/14.
 */
@Controller
@RequestMapping("/auto")
public class AutoTestController extends BaseController {

    @Autowired
    private ProjectService projectService;

    @Autowired
    private AutoTestService autoTestService;

    @Autowired
    private FunctionService functionService;

    @Autowired
    private UnitTestService unitTestService;

    @Resource
    private AmqpTemplate amqpTemplate;

    @RequestMapping("/view")
    public String view(ModelMap model) {

        List<AutoTest> autoTests = autoTestService.findFinishedTest(getCurrentUser().getId());
        model.addAttribute("finished", autoTests);

        return "/test/auto";
    }

    @RequestMapping("/detail")
    public String detail(ModelMap model, @RequestParam(value = "id", required = true) Long id) {

        AutoTest autoTest = autoTestService.selectById(id);
        List<UnitTest> testList = unitTestService.findAutoTestList(id);
        model.addAttribute("autoTest", autoTest);
        model.addAttribute("testList", testList);
        return "/test/detail";
    }


    /**
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/projects", method = RequestMethod.GET)
    public String list() {
        List<Project> projects = projectService.getProjectList(getCurrentUser().getId());
        return JsonUtil.getInstance().setList(projects).result();
    }


    /**
     * 获取正在进行测试的数据
     *
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/testing", method = RequestMethod.GET)
    public String loadtesting() {

        List<AutoTest> tests = autoTestService.findTesting(getCurrentUser().getId());
        return JsonUtil.getInstance().setList(tests).result();
    }

    @ResponseBody
    @RequestMapping(value = "/test", method = RequestMethod.POST)
    public String test(@RequestParam(value = "title", required = true) String title,
                       @RequestParam(value = "pId", required = true) Long pId,
                       @RequestParam(value = "headers", required = true) String headers) {
        HashMap<String, Object> params = new HashMap<>();
        params.put("title", title);
        params.put("pId", pId);
        params.put("headers", headers);
        params.put("uId", getCurrentUser().getId());
        amqpTemplate.convertAndSend("queueTestKey", JSON.toJSONString(params));
        return JsonUtil.getInstance().setStatus(1).result();
    }

    @ResponseBody
    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public String delete(@RequestParam(value = "id", required = true) Long id) {

        return JsonUtil.getInstance().setStatus(autoTestService.deleteById(id) == true ? 1 : 0).result();
    }


}
