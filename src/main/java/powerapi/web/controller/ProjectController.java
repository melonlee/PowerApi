package powerapi.web.controller;

import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import powerapi.common.utils.FontImageUtils;
import powerapi.entity.Module;
import powerapi.entity.Project;
import powerapi.entity.User;
import powerapi.service.ModuleService;
import powerapi.service.ProjectService;

@Controller
@RequestMapping("/project")
public class ProjectController extends BaseController<Project> {

    @Autowired
    private ProjectService projectService;

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
        List<Project> projects = projectService.selectPage(new Page<Project>(page, 10),
                new EntityWrapper<Project>().eq("user_id", getCurrentUser().getId()).orderBy("createdate", false)).getRecords();
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
    @RequestMapping(value = "/modify", method = RequestMethod.POST)
    public String submit(Project project) {
        project.setUserId(getCurrentUser().getId());
        projectService.insertOrUpdate(project);
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
    public String info(ModelMap model, @RequestParam(value = "id", required = true, defaultValue = "0") Long id) {
        Project project = projectService.selectById(id);
        model.addAttribute("project", project);
        return "project/detail";
    }

    /**
     * 删除
     *
     * @param id
     * @return
     */

    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public String delete(@RequestParam(value = "id", required = true, defaultValue = "0") Long id) {
        projectService.deleteById(id);
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
        Project project = projectService.selectById(id);
        List<Module> modules = moduleService.selectByProjectId(id);
        model.addAttribute("modules", modules);
        model.addAttribute("project", project);
        return "project/doc";
    }

}
