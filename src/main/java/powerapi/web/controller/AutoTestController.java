package powerapi.web.controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
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


    @RequestMapping("/view")
    public String view(ModelMap model) {

        List<AutoTest> autoTests = autoTestService.findFinishedTest(getCurrentUser().getId());
        model.addAttribute("finished", autoTests);
        return "/test/auto";
    }

    @ResponseBody
    @RequestMapping(value = "/projects", method = RequestMethod.GET)
    public String list() {
        List<Project> projects = projectService.getProjectList(getCurrentUser().getId());
        return JsonUtil.getInstance().setList(projects).result();
    }

    @ResponseBody
    @RequestMapping(value = "/test", method = RequestMethod.POST)
    public String test(@RequestParam(value = "title", required = true) String title,
                       @RequestParam(value = "pId", required = true) Long pId,
                       @RequestParam(value = "headers", required = true) String headers) {

        System.out.println("headers====>>>>>" + headers);

        Long currentTimeMillis = System.currentTimeMillis();
        Project project = projectService.findProjectById(pId);

        JSONArray headerJsonArray = JSONObject.parseObject(headers).getJSONArray("headers");
        HashMap<String, String> headersMap = null;
        if (null != headerJsonArray && headerJsonArray.size() > 0) {
            headersMap = getParamsOrHeadersMap(headerJsonArray);
        }
        List<Function> functionList = functionService.selectByProjectId(project.getId());

        RequestDto requestDto;

        powerapi.entity.AutoTest autoBean = new powerapi.entity.AutoTest();
        autoBean.setTitle("#" + title + "-" + project.getTitle());
        autoBean.setUserId(getCurrentUser().getId());
        autoBean.setTotalcount(functionList.size());
        autoBean.setpId(project.getId());
        autoTestService.insert(autoBean);
        int errorcount = 0;
        for (Function function : functionList) {

            requestDto = new RequestDto();

            JSONObject paramObject = JSONObject.parseObject(function.getParams());

            requestDto.setMethod(function.getMethod());
            requestDto.setUrl(project.getHostUrl() + function.getModule().getUrl() + function.getUrl());

            /**
             * 解析header
             * 解析参数
             *
             */
            HashMap<String, String> paramsMap = getParamsOrHeadersMap(paramObject.getJSONArray("params"));

            /**
             * 提交测试
             */
            UnitTest unitTest = HttpUtil.doRequest(requestDto, paramsMap, headersMap);
            if (unitTest.getResponseCode() != 200) {
                errorcount++;
            }
            unitTest.setUserId(getCurrentUser().getId());
            unitTest.setParams(requestDto.getParams());
            unitTest.setAutoId(autoBean.getId());
            unitTestService.insert(unitTest);
        }
        autoBean.setTotaltime((int) (System.currentTimeMillis() - currentTimeMillis));
        autoBean.setErrorcount(errorcount);
        autoBean.setStatus(1);
        autoTestService.updateById(autoBean);
        return JsonUtil.getInstance().setStatus(autoBean.getId().intValue()).result();
    }


    private HashMap<String, String> getParamsOrHeadersMap(JSONArray array) {
        HashMap<String, String> resultMap = new HashMap<>();
        if (null != array && array.size() > 0) {
            int loop = 0;
            while (loop < array.size()) {
                JSONObject jsonObject = array.getJSONObject(loop);
                resultMap.put(jsonObject.getString("name"), jsonObject.getString("value"));
                loop++;
            }
        }
        return resultMap;
    }
}
