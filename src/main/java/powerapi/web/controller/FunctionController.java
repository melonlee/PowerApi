package powerapi.web.controller;

import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import powerapi.entity.Function;
import powerapi.entity.Module;
import powerapi.entity.Project;
import powerapi.service.FunctionService;
import powerapi.service.ModuleService;
import powerapi.service.ProjectService;


@Controller
@RequestMapping("function")
public class FunctionController {

    @Resource
    private FunctionService functionService;

    @Resource
    private ModuleService moduleService;

    @Resource
    private ProjectService projectService;

    @ResponseBody
    @RequestMapping(value = "list", method = {RequestMethod.POST,
            RequestMethod.GET})
    public String list(
            @RequestParam(value = "mID", required = false, defaultValue = "0") Long mID) {

//		ArrayList<Function> list = functionService.listByModule(mID);
//
//		return MJsonUtils.getInstance().setList(list).result();
        return null;
    }

    @RequestMapping(value = "view", method = {RequestMethod.POST,
            RequestMethod.GET})
    public String view(
            ModelMap model,
            @RequestParam(value = "proID", required = false, defaultValue = "0") Long proID) {

        Project project = projectService.selectById(proID);
//        ArrayList<Module> list = moduleService.findModulesByPro(proID);
        model.addAttribute("list", null);
        model.addAttribute("project", project);

        return "interfaceview";
    }

    @ResponseBody
    @RequestMapping(value = "modify", method = {RequestMethod.POST,
            RequestMethod.GET})
    public String modify(Function function, HttpSession session) {
//
//        Integer status = functionService.create(function);
//
//        return MJsonUtils.getInstance().setStatus(status).result();
        return null;
    }

    @ResponseBody
    @RequestMapping(value = "remove", method = {RequestMethod.POST,
            RequestMethod.GET})
    public String remove(
            @RequestParam(value = "id", required = false, defaultValue = "0") int id) {

//        Integer status = functionService.remove(id);
//
//        return MJsonUtils.getInstance().setStatus(status).result();
        return null;
    }

    /**
     * 标记接口
     *
     * @param id
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "tag", method = {RequestMethod.POST,
            RequestMethod.GET})
    public String tag(
            @RequestParam(value = "id", required = false, defaultValue = "0") Long id,
            @RequestParam(value = "status", required = false, defaultValue = "0") int status) {
        Function function = new Function();
        function.setId(id);
        function.setStatus(status);
//        Integer rs = functionService.tag(function);
//
//        return MJsonUtils.getInstance().setStatus(rs).result();
        return null;
    }

    @RequestMapping(value = "basic", method = {RequestMethod.POST,
            RequestMethod.GET})
    public String basic(
            ModelMap model,
            @RequestParam(value = "proID", required = false, defaultValue = "0") Long proID,
            @RequestParam(value = "id", required = false, defaultValue = "0") Long id) {

        Project project = projectService.selectById(proID);
//        ArrayList<Module> list = moduleService.list(proID);
//        model.addAttribute("list", list);
        model.addAttribute("project", project);
        Function function = functionService.selectById(id);
        model.addAttribute("function", function);
        return "interfaceview";
    }

    @RequestMapping(value = "test", method = {RequestMethod.POST,
            RequestMethod.GET})
    public String modify(
            ModelMap model,
            @RequestParam(value = "proID", required = false, defaultValue = "0") Long proID,
            @RequestParam(value = "id", required = false, defaultValue = "0") Long id) {
        Project project = projectService.selectById(proID);
        Function function = functionService.selectById(id);
        Module module = moduleService.selectById(function.getmId());
        function.setUrl(project.getHostUrl() + module.getUrl()
                + function.getUrl());
        model.addAttribute("function", function);
        return "quicktest";
    }

}
