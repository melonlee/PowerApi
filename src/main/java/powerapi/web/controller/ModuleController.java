package powerapi.web.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import powerapi.common.utils.JsonUtils;
import powerapi.entity.Module;
import powerapi.entity.Project;
import powerapi.service.ModuleService;
import powerapi.service.ProjectService;

import java.util.List;


@Controller
@RequestMapping("/module")
public class ModuleController extends BaseController<Module> {

    @Autowired
    private ModuleService moduleService;

    @Autowired
    private ProjectService projectService;

    @RequestMapping(value = "/all", method = RequestMethod.GET)
    public String all(ModelMap model, @RequestParam(value = "proId", required = true) Long proId) {

        Project project = projectService.selectById(proId);
        List<Module> modules = moduleService.selectByProjectId(proId);
        model.addAttribute("modules", modules);
        model.addAttribute("project", project);
        return "/module/index";
    }

    @RequestMapping(value = "/create", method = RequestMethod.GET)
    public String create(
            ModelMap model,
            @RequestParam(value = "proId", required = true) Long proId) {
        Project project = projectService.selectById(proId);
        model.addAttribute("project", project);
        return "/module/detail";
    }


    @RequestMapping(value = "/view", method = RequestMethod.GET)
    public String view(
            ModelMap model,
            @RequestParam(value = "id", required = true) Long id,
            @RequestParam(value = "proId", required = true) Long proId) {

        Project project = projectService.selectById(proId);
        model.addAttribute("project", project);

        if (id != 0) {
            Module module = moduleService.selectById(id);
            model.addAttribute("module", module);
        }
        return "/module/detail";
    }

    @RequestMapping(value = "/modify", method = RequestMethod.POST)
    public String modify(ModelMap model, Module module) {
        module.setUserId(getCurrentUser().getId());
        model.addAttribute("status", moduleService.insertOrUpdate(module));
        return "redirect:/module/all?proId=" + module.getpId();
    }

    @ResponseBody
    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public String delete(
            @RequestParam(value = "id", required = true) Long id) {
        Integer status = moduleService.deleteById(id) ? 1 : 0;
        return JsonUtils.getInstance().setStatus(status).result();
    }

}
