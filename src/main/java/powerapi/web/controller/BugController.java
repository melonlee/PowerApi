package powerapi.web.controller;

import java.util.List;

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
import powerapi.common.utils.JsonUtil;
import powerapi.entity.Bug;
import powerapi.entity.BugComment;
import powerapi.entity.Project;
import powerapi.service.BugCommentService;
import powerapi.service.BugService;


@Controller
@RequestMapping("/bug")
public class BugController extends BaseController {

    @Autowired
    private BugService bugService;

    @Autowired
    private BugCommentService bugCommentService;

    @RequestMapping(value = "/all", method = RequestMethod.GET)
    public String list(
            ModelMap model,
            @RequestParam(value = "proId", required = true) Long proId) {
        List<Bug> list = bugService.selectByProjectId(proId);
        model.addAttribute("bugs", list);
        model.addAttribute("project", getProject(proId));
        return "/bug/index";
    }

    @RequestMapping(value = "/create", method = RequestMethod.GET)
    public String create(
            ModelMap model,
            @RequestParam(value = "proId", required = true) Long proId) {
        model.addAttribute("project", getProject(proId));
        return "bug/detail";
    }

    @LogModify(resource = Constants.LOG_RESOURCE_BUG)
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
        model.addAttribute("project", getProject(proId));
        Bug bug = bugService.selectById(id);
        model.addAttribute("bug", bug);
        return "/bug/detail";
    }

    @RequestMapping(value = "/view", method = RequestMethod.GET)
    public String view(ModelMap model,
                       @RequestParam(value = "id", required = true) Long id) {
        Bug bug = bugService.selectById(id);
        model.addAttribute("bug", bug);
        model.addAttribute("project", getProject(bug.getpId()));
        //获取评论
        List<BugComment> comments = bugCommentService.findByBugId(id);
        model.addAttribute("comments", comments);
        return "/bug/view";
    }

    @LogDelete(resource = Constants.LOG_RESOURCE_BUG)
    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public String delete(
            ModelMap model,
            @RequestParam(value = "id", required = false, defaultValue = "0") Long id) {
        Bug bug = bugService.selectById(id);
        model.addAttribute("status", bugService.deleteById(id));
        return "redirect:/bug/all?proId=" + bug.getpId();
    }

    @ResponseBody
    @RequestMapping(value = "/comment", method = RequestMethod.POST)
    public String comment(BugComment comment) {
        comment.setUserId(getCurrentUser().getId());
        Integer status = bugCommentService.insert(comment) ? 1 : 0;
        return JsonUtil.getInstance().setStatus(status).result();
    }

}
