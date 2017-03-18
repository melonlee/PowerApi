package powerapi.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import powerapi.common.Constants;
import powerapi.common.anno.LogAnno;
import powerapi.common.anno.LogModify;
import powerapi.entity.Module;
import powerapi.entity.Project;
import powerapi.service.ModuleService;

@Controller
@RequestMapping("/project")
public class ProjectController extends BaseController {

    @Autowired
    private ModuleService moduleService;

    /**
     * 根据页码获取项目列表
     * 根据创建时间倒排
     *
     * @param model
     * @param page
     * @return
     */
    @RequestMapping(value = "/all", method = RequestMethod.GET)
    public String list(ModelMap model, @RequestParam(defaultValue = "1") int page) {
        List<Project> projects = projectService.getProjectList(getCurrentUser().getId(), page);
        model.addAttribute("projects", projects);
        return "/project/index";
    }

    /**
     * 新增项目
     *
     * @return
     */
    @RequestMapping(value = "/create", method = RequestMethod.GET)
    public String create() {
        return "/project/create";
    }

    /**
     * 编辑项目
     *
     * @param project
     * @return
     */
    @LogModify(resource = Constants.LOG_RESOURCE_PROJECT)
    @RequestMapping(value = "/modify", method = RequestMethod.POST)
    public String modify(Project project) {
        project.setUserId(getCurrentUser().getId());
        projectService.modifyProject(project);
        return "redirect:/project/all";
    }

    /**
     * 详情
     *
     * @param model
     * @param id
     * @return
     */

    @RequestMapping(value = "/view", method = RequestMethod.GET)
    public String view(ModelMap model, @RequestParam(value = "id", required = true) Long id) {
        model.addAttribute("project", getProject(id));
        return "project/detail";
    }

    /**
     * 删除
     *
     * @param id
     * @return
     */
    @LogAnno(resource = Constants.LOG_RESOURCE_PROJECT, action = Constants.LOG_ACTION_DELETE)
    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public String delete(@RequestParam(value = "id", required = true) Long id) {
        projectService.deleteProject(id);
        return "redirect:/project/all";
    }

    /**
     * 预览项目文档
     *
     * @param model
     * @param id
     * @return
     */
    @RequestMapping(value = "/doc", method = RequestMethod.GET)
    public String preview(ModelMap model, @RequestParam(value = "id", required = true) Long id) {
        List<Module> modules = moduleService.selectByProjectId(id);
        model.addAttribute("modules", modules);
        model.addAttribute("project", getProject(id));
        return "project/doc";
    }

}
