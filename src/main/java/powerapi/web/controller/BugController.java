package powerapi.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import powerapi.common.utils.JsonUtils;
import powerapi.entity.Bug;
import powerapi.entity.BugComment;
import powerapi.entity.Project;
import powerapi.service.BugCommentService;
import powerapi.service.BugService;
import powerapi.service.ProjectService;


@Controller
@RequestMapping("/bug")
public class BugController extends BaseController<Bug> {

    @Autowired
    private BugService bugService;

    @Autowired
    private BugCommentService bugCommentService;

    @Autowired
    private ProjectService projectService;

    @RequestMapping(value = "/all", method = RequestMethod.GET)
    public String list(
            ModelMap model,
            @RequestParam(value = "proId", required = true) Long proId) {

        Project project = projectService.selectById(proId);
        List<Bug> list = bugService.selectByProjectId(proId);
        model.addAttribute("bugs", list);
        model.addAttribute("project", project);
        return "/bug/index";
    }

    @RequestMapping(value = "/create", method = RequestMethod.GET)
    public String create(
            ModelMap model,
            @RequestParam(value = "proId", required = true) Long proId) {
        Project project = projectService.selectById(proId);
        model.addAttribute("project", project);
        return "bug/detail";
    }

    @RequestMapping(value = "/modify", method = RequestMethod.POST)
    public String modify(Bug bug) {

        bug.setUserId(getCurrentUser().getId());

        bugService.insertOrUpdate(bug);

        return "redirect:/bug/all?proId=" + bug.getpId();
    }

    @RequestMapping(value = "/modify", method = RequestMethod.GET)
    public String modify(
            ModelMap model,
            @RequestParam(value = "proId", required = true) Long proId,
            @RequestParam(value = "id", required = true) Long id) {
        Project project = projectService.selectById(proId);
        model.addAttribute("project", project);
        Bug bug = bugService.selectById(id);
        model.addAttribute("bug", bug);
        return "/bug/detail";
    }

    @RequestMapping(value = "/view", method = RequestMethod.GET)
    public String basic(ModelMap model,
                        @RequestParam(value = "id", required = true) Long id) {
        Bug bug = bugService.selectById(id);
        model.addAttribute("bug", bug);
        //获取评论
        List<BugComment> comments = bugCommentService.findByBugId(id);
        model.addAttribute("comments", comments);
        return "/bug/view";
    }

    @RequestMapping(value = "/delete", method = {RequestMethod.POST,
            RequestMethod.GET})
    public String remove(
            ModelMap model,
            @RequestParam(value = "id", required = false, defaultValue = "0") Long id) {
        Bug bug = bugService.selectById(id);
        model.addAttribute("status", bugService.deleteById(id));
        return "redirect:/bug/all?proId=" + bug.getpId();
    }

    @ResponseBody
    @RequestMapping(value = "/comment", method = RequestMethod.POST)
    public String comment(ModelMap model, BugComment comment) {
        comment.setUserId(getCurrentUser().getId());
        Integer status = bugCommentService.insert(comment) ? 1 : 0;
        return JsonUtils.getInstance().setStatus(status).result();
    }

}
