package powerapi.web.controller;

import java.lang.reflect.InvocationTargetException;
import java.util.HashMap;
import java.util.List;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import powerapi.common.Constants;
import powerapi.common.anno.LogDelete;
import powerapi.common.anno.LogModify;
import powerapi.common.utils.HttpUtil;
import powerapi.common.utils.JsonUtil;
import powerapi.dto.RequestParamDto;
import powerapi.dto.RequestDto;
import powerapi.entity.*;
import powerapi.service.FunctionService;
import powerapi.service.ModuleService;
import powerapi.service.UnitTestService;


@Controller
@RequestMapping("/function")
public class FunctionController extends BaseController {

    @Autowired
    private FunctionService functionService;

    @Autowired
    private ModuleService moduleService;

    @Autowired
    private UnitTestService unitTestService;

    @ResponseBody
    @RequestMapping(value = "/all", method = RequestMethod.GET)
    public String list(
            @RequestParam(value = "mId", required = true) Long mId) {
        List<Function> list = functionService.selectByModuleId(mId);
        return JsonUtil.getInstance().setList(list).result();
    }

    @RequestMapping(value = "/create", method = RequestMethod.GET)
    public String create(
            ModelMap model,
            @RequestParam(value = "proId", required = true) Long proId) {
        Project project = projectService.selectById(proId);
        List<Module> modules = moduleService.selectByProjectId(proId);
        model.addAttribute("modules", modules);
        model.addAttribute("project", project);
        return "interface/detail";
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

    @LogModify(resource = Constants.LOG_RESOURCE_INTERFACE)
    @ResponseBody
    @RequestMapping(value = "/modify", method = RequestMethod.POST)
    public String modify(Function function) {
        Integer status = functionService.insertOrUpdate(function) ? 1 : 0;
        return JsonUtil.getInstance().setStatus(status).result();
    }

    @ResponseBody
    @LogDelete(resource = Constants.LOG_RESOURCE_INTERFACE)
    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public String remove(Function function) {
        function = functionService.selectById(function.getId());
        Integer status = functionService.deleteById(function.getId()) ? 1 : 0;
        return JsonUtil.getInstance().setStatus(status).result();
    }

    /**
     * 标记接口状态
     *
     * @param id
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/tag", method = RequestMethod.GET)
    public String tag(
            @RequestParam(value = "id", required = true) Long id,
            @RequestParam(value = "status", required = false, defaultValue = "0") int status) {
        Function function = new Function();
        function.setId(id);
        function.setStatus(status);
        Integer rs = functionService.updateById(function) ? 1 : 0;
        return JsonUtil.getInstance().setStatus(rs).result();
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
        model.addAttribute("project", project);
        model.addAttribute("function", function);
        return "interface/test";
    }

    @ResponseBody
    @RequestMapping(value = "/test", method = RequestMethod.POST)
    public String test(RequestDto requestDto) throws IllegalAccessException,
            InvocationTargetException {

        JSONObject paramObject = JSONObject.parseObject(requestDto.getParams());
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
        UnitTest unitTest = HttpUtil.doPost(requestDto.getUrl(), paramsMap);
        unitTest.setUserId(getCurrentUser().getId());
        unitTest.setParams(requestDto.getParams());
        unitTestService.insert(unitTest);
        return JsonUtil.getInstance().setBean(unitTest, null != unitTest ? 1 : 0)
                .result();
    }

}
