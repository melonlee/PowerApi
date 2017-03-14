package powerapi.web.controller;

import java.lang.reflect.InvocationTargetException;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import powerapi.common.utils.HttpUtils;
import powerapi.common.utils.JsonUtils;
import powerapi.dto.RequestParamDto;
import powerapi.dto.RequestDto;
import powerapi.entity.*;
import powerapi.service.FunctionService;
import powerapi.service.ModuleService;
import powerapi.service.ProjectService;


@Controller
@RequestMapping("/function")
public class FunctionController {

    @Resource
    private FunctionService functionService;

    @Resource
    private ModuleService moduleService;

    @Resource
    private ProjectService projectService;

    @ResponseBody
    @RequestMapping(value = "/all", method = RequestMethod.GET)
    public String list(
            @RequestParam(value = "mId", required = true) Long mId) {
        List<Function> list = functionService.selectByModuleId(mId);
        return JsonUtils.getInstance().setList(list).result();
    }

    @RequestMapping(value = "/view", method = RequestMethod.GET)
    public String view(
            ModelMap model,
            @RequestParam(value = "proId", required = true) Long proId,
            @RequestParam(value = "id", required = false, defaultValue = "0") Long id) {

        Project project = projectService.selectById(proId);
        List<Module> modules = moduleService.selectByProjectId(proId);
        model.addAttribute("modules", modules);
        model.addAttribute("project", project);
        if (id != 0) {
            Function function = functionService.selectById(id);
            model.addAttribute("function", function);
        }
        return "interface/detail";
    }

    @ResponseBody
    @RequestMapping(value = "/modify", method = RequestMethod.POST)
    public String modify(Function function) {
        Integer status = functionService.insertOrUpdate(function) ? 1 : 0;
        return JsonUtils.getInstance().setStatus(status).result();
    }

    @ResponseBody
    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public String remove(
            @RequestParam(value = "id", required = true) int id) {
        Integer status = functionService.deleteById(id) ? 1 : 0;
        return JsonUtils.getInstance().setStatus(status).result();
    }

    /**
     * 标记接口
     *
     * @param id
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/tag", method = {RequestMethod.POST,
            RequestMethod.GET})
    public String tag(
            @RequestParam(value = "id", required = false, defaultValue = "0") Long id,
            @RequestParam(value = "status", required = false, defaultValue = "0") int status) {
        Function function = new Function();
        function.setId(id);
        function.setStatus(status);
//        Integer rs = functionService.tag(function);
//
//        return JsonUtils.getInstance().setStatus(rs).result();
        return null;
    }


    @RequestMapping(value = "/test", method = RequestMethod.GET)
    public String modify(
            ModelMap model,
            @RequestParam(value = "proId", required = true) Long proId,
            @RequestParam(value = "id", required = true) Long id) {
        Project project = projectService.selectById(proId);
        Function function = functionService.selectById(id);
        Module module = moduleService.selectById(function.getmId());
        function.setUrl(project.getHostUrl() + module.getUrl()
                + function.getUrl() + project.getPattern());
        model.addAttribute("function", function);
        return "interface/test";
    }

    @ResponseBody
    @RequestMapping(value = "/test", method = RequestMethod.POST)
    public String test(ModelMap modelMap, RequestDto quicktest,
                       HttpSession session) throws IllegalAccessException,
            InvocationTargetException {

        JSONObject paramObject = JSONObject.parseObject(quicktest.getParams());

        JSONArray params = paramObject.getJSONArray("params");

        RequestParamDto param;

        HashMap<String, String> paramsMap = new HashMap();
        for (int loop = 0; loop < params.size(); loop++) {

            JSONObject paramJson = params.getJSONObject(loop);

            param = new RequestParamDto();
            param.setName(paramJson.getString("name"));
            param.setType(paramJson.getString("type"));
            param.setValue(paramJson.getString("value"));

            paramsMap.put(param.getName(), param.getValue());
        }

        UnitTest requester = HttpUtils.doPost(quicktest.getUrl(), paramsMap);
        requester.setUserId(1);
        requester.setParams(quicktest.getParams());
//		quicktestService.saveTest(requester);
        return JsonUtils.getInstance().setBean(requester, 1)
                .result();
    }

}
