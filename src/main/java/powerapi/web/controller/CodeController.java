package powerapi.web.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import powerapi.entity.Code;
import powerapi.entity.Project;
import powerapi.service.CodeService;
import powerapi.service.ProjectService;


@Controller
@RequestMapping("/code")
public class CodeController extends BaseController {

    @Autowired
    private CodeService codeService;

    @RequestMapping(value = "/all", method = RequestMethod.GET)
    public String list(
            ModelMap model,
            @RequestParam(value = "proId", required = true) Long proId) {

        Project project = projectService.selectById(proId);
        List<Code> codes = codeService.selectByProjectId(proId);
        model.addAttribute("codes", codes);
        model.addAttribute("project", project);
        return "code/index";
    }

    @RequestMapping(value = "/create", method = RequestMethod.GET)
    public String create(
            ModelMap model,
            @RequestParam(value = "proId", required = true) Long proId) {
        Project project = projectService.selectById(proId);
        model.addAttribute("project", project);
        return "code/detail";
    }

    @RequestMapping(value = "/modify", method = RequestMethod.POST)
    public String submit(Code code) {
        code.setUserId(getCurrentUser().getId());
        codeService.insertOrUpdate(code);
        return "redirect:/code/all?proId=" + code.getpId();
    }

    @RequestMapping(value = "/view", method = RequestMethod.GET)
    public String basic(
            ModelMap model,
            @RequestParam(value = "proId", required = true) Long proId,
            @RequestParam(value = "id", required = true) Long id) {

        Project project = projectService.selectById(proId);
        model.addAttribute("project", project);
        Code code = codeService.selectById(id);
        model.addAttribute("code", code);
        return "code/detail";
    }

    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public String remove(@RequestParam(value = "id", required = true) Long id) {
        Code code = codeService.selectById(id);
        codeService.deleteById(id);
        return "redirect:/code/all?proId=" + code.getpId();
    }

}
