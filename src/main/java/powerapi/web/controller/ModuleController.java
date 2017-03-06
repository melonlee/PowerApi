package powerapi.web.controller;

import javax.annotation.Resource;

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
public class ModuleController {

    @Resource
    private ModuleService moduleService;

    @Resource
    private ProjectService projectService;

    @RequestMapping(value = "/all", method = {RequestMethod.POST,
            RequestMethod.GET})
    public String all(ModelMap model, @RequestParam(value = "proId", required = true) Long proId) {

        Project project = projectService.selectById(proId);
        List<Module> modules = moduleService.selectByProjectId(proId);
        model.addAttribute("modules", modules);
        model.addAttribute("project", project);
        return "/module/index";
    }

    @RequestMapping(value = "/view", method = {RequestMethod.POST,
            RequestMethod.GET})
    public String view(
            ModelMap model,
            @RequestParam(value = "id", required = false, defaultValue = "0") Long id,
            @RequestParam(value = "proId", required = false, defaultValue = "0") Long proId) {

        Project project = projectService.selectById(proId);
        model.addAttribute("project", project);

        if (id != 0) {
            Module module = moduleService.selectById(id);
            model.addAttribute("module", module);
        }
        return "/module/detail";
    }

    @RequestMapping(value = "/modify", method = {RequestMethod.POST,
            RequestMethod.GET})
    public String submit(ModelMap model, Module module) {

        module.setUserId(1L);
        boolean status;
        if (null != module.getId()) {
            status = moduleService.updateById(module);
        } else {
            status = moduleService.insert(module);
        }
        model.addAttribute("status", status);
        return "redirect:/module/all?proId=" + module.getpId();
    }

    @ResponseBody
    @RequestMapping(value = "/remove", method = {RequestMethod.POST,
            RequestMethod.GET})
    public String remove(
            @RequestParam(value = "id", required = false, defaultValue = "0") int id) {

        Integer status = moduleService.deleteById(id) ? 1 : 0;

        return JsonUtils.getInstance().setStatus(status).result();
    }

}
