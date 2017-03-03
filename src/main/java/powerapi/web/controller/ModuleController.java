package powerapi.web.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
    public String all(ModelMap model, @RequestParam(value = "proID", required = true) Long proID) {

        Project project = projectService.selectById(proID);
        List<Module> modules = moduleService.selectByProjectId(proID);
        model.addAttribute("modules", modules);
        model.addAttribute("project", project);
        return "interfaces";
    }

    @RequestMapping(value = "view", method = {RequestMethod.POST,
            RequestMethod.GET})
    public String view(
            ModelMap model,
            @RequestParam(value = "id", required = false, defaultValue = "0") Long id,
            @RequestParam(value = "proID", required = false, defaultValue = "0") Long proID) {

        Project project = projectService.selectById(proID);
        model.addAttribute("project", project);

        if (id != 0) {
            Module module = moduleService.selectById(id);
            model.addAttribute("module", module);
        }
        return "moduleview";
    }

    @RequestMapping(value = "submit", method = {RequestMethod.POST,
            RequestMethod.GET})
    public String submit(ModelMap model, HttpServletRequest request,
                         HttpSession session, Module module) {

        module.setUserId(1L);
        model.addAttribute("status", moduleService.insert(module));

        return all(model, module.getpId());
    }

    @ResponseBody
    @RequestMapping(value = "remove", method = {RequestMethod.POST,
            RequestMethod.GET})
    public String remove(
            @RequestParam(value = "id", required = false, defaultValue = "0") int id) {

//        Integer status = moduleService.remove(id);
//
//        return MJsonUtils.getInstance().setStatus(status).result();
        return null;
    }

}
