package powerapi.web.controller;

import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import powerapi.entity.Bug;
import powerapi.entity.Project;
import powerapi.entity.User;
import powerapi.service.BugService;
import powerapi.service.ProjectService;


@Controller
@RequestMapping("/bug")
public class BugController {

    @Resource
    private BugService bugService;

    @Resource
    private ProjectService projectService;

    private User user;

    @RequestMapping(value = "list", method = {RequestMethod.POST,
            RequestMethod.GET})
    public String list(
            ModelMap model,
            @RequestParam(value = "proID", required = false, defaultValue = "0") Long proID) {

        Project project = projectService.selectById(proID);
        ArrayList<Bug> list = (ArrayList<Bug>) bugService.selectList(null);
        model.addAttribute("list", list);
        model.addAttribute("project", project);

        return "bugs";
    }

    @RequestMapping(value = "create", method = {RequestMethod.POST,
            RequestMethod.GET})
    public String create(
            ModelMap model,
            @RequestParam(value = "proID", required = false, defaultValue = "0") Long proID) {
        Project project = projectService.selectById(proID);
        model.addAttribute("project", project);
        return "bugview";
    }

    @RequestMapping(value = "submit", method = {RequestMethod.POST,
            RequestMethod.GET})
    public String submit(ModelMap model, Bug bug, HttpSession session) {

        user = (User) session.getAttribute("curUser");

        bug.setUserId(user.getId());

        model.addAttribute("status", bugService.insert(bug));

        return list(model, bug.getpId());
    }

    @RequestMapping(value = "basic", method = {RequestMethod.POST,
            RequestMethod.GET})
    public String basic(
            ModelMap model,
            @RequestParam(value = "proID", required = false, defaultValue = "0") Long proID,
            @RequestParam(value = "id", required = false, defaultValue = "0") Long id) {

        Project project = projectService.selectById(proID);
        model.addAttribute("project", project);
        Bug bug = bugService.selectById(id);
        model.addAttribute("bug", bug);

        return "bugview";
    }

    @RequestMapping(value = "remove", method = {RequestMethod.POST,
            RequestMethod.GET})
    public String remove(
            ModelMap model,
            @RequestParam(value = "id", required = false, defaultValue = "0") Long id) {

        Bug bug = bugService.selectById(id);
        model.addAttribute("status", bugService.deleteById(id));

        return list(model, bug.getpId());
    }

}
