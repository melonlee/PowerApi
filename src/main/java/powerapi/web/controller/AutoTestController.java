package powerapi.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import powerapi.common.utils.JsonUtil;
import powerapi.entity.Project;
import powerapi.service.ProjectService;

import java.util.List;

/**
 * Created by Melon on 17/3/14.
 */
@Controller
@RequestMapping("/auto")
public class AutoTestController extends BaseController {

    @Autowired
    private ProjectService projectService;

    @RequestMapping("/view")
    public String view() {
        return "/test/auto";
    }

    @ResponseBody
    @RequestMapping(value = "/projects", method = RequestMethod.POST)
    public String list() {
        List<Project> projects = projectService.getProjectList(getCurrentUser().getId());
        return JsonUtil.getInstance().setList(projects).result();
    }
}
