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
        return "bug/index";
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
            @RequestParam(value = "proId", required = false, defaultValue = "0") Long proId,
            @RequestParam(value = "id", required = true) Long id) {

        Bug bug = bugService.selectById(id);
        model.addAttribute("bug", bug);
        if (proId == 0) {
            proId = bug.getpId();
        }
        model.addAttribute("project", getProject(proId));
        return "/bug/detail";
    }

    @RequestMapping(value = "/close", method = RequestMethod.GET)
    public String close(
            @RequestParam(value = "id", required = true) Long id) {
        Bug bug = bugService.selectById(id);
        bug.setStatus(1);
        bugService.updateById(bug);
        return "redirect:/bug/all?proId=" + bug.getpId();
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
        return "bug/view";
    }

    @LogDelete(resource = Constants.LOG_RESOURCE_BUG)
    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public String delete(Bug bug) {
        Bug bugTemp = bugService.selectById(bug.getId());
        bug.setTitle(bugTemp.getTitle());
        bugService.deleteById(bug.getId());
        return "redirect:/bug/all?proId=" + bugTemp.getpId();
    }

    @ResponseBody
    @RequestMapping(value = "/comment", method = RequestMethod.POST)
    public String comment(BugComment comment) {
        comment.setUserId(getCurrentUser().getId());
        Integer status = bugCommentService.insert(comment) ? 1 : 0;
        return JsonUtil.getInstance().setStatus(status).result();
    }

}
