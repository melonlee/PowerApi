package powerapi.web.controller;

import java.lang.reflect.InvocationTargetException;
import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import powerapi.entity.Function;
import powerapi.entity.Module;
import powerapi.entity.Project;
import powerapi.entity.Quicktest;
import powerapi.service.FunctionService;
import powerapi.service.ModuleService;
import powerapi.service.ProjectService;


@Controller
@RequestMapping("/preview")
public class PreviewController {

    @Resource
    private ProjectService projectService;

    @Resource
    private ModuleService moduleService;

    @Resource
    private FunctionService functionService;

    /*
     * 获取当前项目以及项目下的模块信息
     */
    @RequestMapping(value = "{id}", method = {RequestMethod.POST,
            RequestMethod.GET})
    public String preview(ModelMap model, @PathVariable("id") Long id) {
        Project project = projectService.selectById(id);
//		ArrayList<Module> list = moduleService.findModulesByPro(id);
//		model.addAttribute("list", list);
        model.addAttribute("project", project);
        return "preview";
    }

    @ResponseBody
    @RequestMapping(value = "functions", method = {RequestMethod.POST,
            RequestMethod.GET})
    public String list(
            @RequestParam(value = "mID", required = false, defaultValue = "0") int mID) {

//		ArrayList<Function> list = functionService.listByModule(mID);
//
//		return MJsonUtils.getInstance().setList(list).result();
        return null;
    }

    @RequestMapping(value = "test", method = {RequestMethod.POST,
            RequestMethod.GET})
    public String test(
            ModelMap model,
            @RequestParam(value = "proID", required = false, defaultValue = "0") Long proID,
            @RequestParam(value = "id", required = false, defaultValue = "0") Long id) {
        Project project = projectService.selectById(proID);
        Function function = functionService.selectById(id);
        Module module = moduleService.selectById(function.getmId());
        function.setUrl(project.getHostUrl() + module.getUrl()
                + function.getUrl());
        model.addAttribute("function", function);
        return "previewtest";
    }

    @ResponseBody
    @RequestMapping(value = "request", method = {RequestMethod.POST,
            RequestMethod.GET})
    public String request(ModelMap modelMap, Quicktest quicktest,
                          HttpSession session) throws IllegalAccessException,
            InvocationTargetException {

//        JSONObject paramObject = new JSONObject(quicktest.getParams());
//
//        JSONArray params = paramObject.getJSONArray("params");
//
//        Param param;
//
//        HashMap<String, String> paramsMap = new HashMap<>();
//        for (int loop = 0; loop < params.length(); loop++) {
//
//            JSONObject paramJson = params.getJSONObject(loop);
//
//            param = new Param();
//            param.setName(paramJson.getString("name"));
//            param.setType(paramJson.getString("type"));
//            param.setValue(paramJson.getString("value"));
//
//            paramsMap.put(param.getName(), param.getValue());
//        }
//
//        Requester requester = MHttpUtils.doPost(quicktest.getUrl(), paramsMap);
//        requester.setParams(quicktest.getParams());
//        return MJsonUtils.getInstance().setBean(requester, 1).result();
        return null;
    }
}
