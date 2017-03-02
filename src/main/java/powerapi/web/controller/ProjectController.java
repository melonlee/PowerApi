package powerapi.web.controller;

import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import powerapi.entity.Module;
import powerapi.entity.Project;
import powerapi.entity.User;
import powerapi.service.ModuleService;
import powerapi.service.ProjectService;

@Controller
@RequestMapping("pro")
public class ProjectController {

    @Resource
    private ProjectService projectService;

    @Resource
    private ModuleService moduleService;

    private User user;

    @RequestMapping(value = "list", method = {RequestMethod.POST,
            RequestMethod.GET})
    public String list(ModelMap model, HttpSession session) {
        user = (User) session.getAttribute("curUser");
//		ArrayList<Project> list = projectService.list(user.getId());
//		model.addAttribute("list", list);
        return "pros";
    }

    @RequestMapping(value = "create", method = {RequestMethod.POST,
            RequestMethod.GET})
    public String create() {

        return "createpro";
    }

    @RequestMapping(value = "submit", method = {RequestMethod.POST,
            RequestMethod.GET})
    public String submit(ModelMap model, HttpServletRequest request,
                         HttpSession session, Project project) {
        user = (User) session.getAttribute("curUser");
        project.setUserId(user.getId());
        model.addAttribute("status", projectService.insert(project));

        return list(model, session);
    }

    @RequestMapping(value = "basic", method = {RequestMethod.POST,
            RequestMethod.GET})
    public String basic(
            ModelMap model,
            @RequestParam(value = "id", required = false, defaultValue = "0") Long id) {

        Project project = projectService.selectById(id);

        model.addAttribute("project", project);

        return "createpro";
    }

    @RequestMapping(value = "remove", method = {RequestMethod.POST,
            RequestMethod.GET})
    public String remove(
            ModelMap model,
            HttpSession session,
            @RequestParam(value = "id", required = false, defaultValue = "0") Long id) {

        model.addAttribute("status", projectService.deleteById(id));

        return list(model, session);
    }

    /*
     * 获取当前项目以及项目下的模块信息
     */
    @RequestMapping(value = "preview", method = {RequestMethod.POST,
            RequestMethod.GET})
    public String preview(
            ModelMap model,
            @RequestParam(value = "id", required = false, defaultValue = "0") Long id) {
        Project project = projectService.selectById(id);
//		ArrayList<Module> list = moduleService.list(id);
//		model.addAttribute("list", list);
        model.addAttribute("project", project);
        return "preview";
    }

}
