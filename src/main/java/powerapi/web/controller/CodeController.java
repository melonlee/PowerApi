package powerapi.web.controller;

import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import powerapi.entity.Code;
import powerapi.entity.Project;
import powerapi.entity.User;
import powerapi.service.CodeService;
import powerapi.service.ProjectService;


@Controller
@RequestMapping("/code")
public class CodeController {

    @Resource
    private CodeService codeService;

    @Resource
    private ProjectService projectService;

    private User user;

    @RequestMapping(value = "list", method = {RequestMethod.POST,
            RequestMethod.GET})
    public String list(
            ModelMap model,
            @RequestParam(value = "proID", required = false, defaultValue = "0") Long proID) {

        Project project = projectService.selectById(proID);
        ArrayList<Code> list = (ArrayList<Code>) codeService.selectList(null);
        model.addAttribute("list", list);
        model.addAttribute("project", project);

        return "codes";
    }

    @RequestMapping(value = "create", method = {RequestMethod.POST,
            RequestMethod.GET})
    public String create(
            ModelMap model,
            @RequestParam(value = "proID", required = false, defaultValue = "0") Long proID) {
        Project project = projectService.selectById(proID);
        model.addAttribute("project", project);
        return "codeview";
    }

    @RequestMapping(value = "submit", method = {RequestMethod.POST,
            RequestMethod.GET})
    public String submit(ModelMap model, HttpServletRequest request, Code code,
                         HttpSession session) {
        user = (User) session.getAttribute("curUser");
        code.setUserId(user.getId());
        model.addAttribute("status", codeService.insert(code));
        return list(model, code.getpId());
    }

    @RequestMapping(value = "basic", method = {RequestMethod.POST,
            RequestMethod.GET})
    public String basic(
            ModelMap model,
            @RequestParam(value = "proID", required = false, defaultValue = "0") Long proID,
            @RequestParam(value = "id", required = false, defaultValue = "0") Long id) {

        Project project = projectService.selectById(proID);
        model.addAttribute("project", project);
        Code code = codeService.selectById(id);
        model.addAttribute("code", code);

        return "codeview";
    }

    @RequestMapping(value = "remove", method = {RequestMethod.POST,
            RequestMethod.GET})
    public String remove(
            ModelMap model,
            @RequestParam(value = "id", required = false, defaultValue = "0") Long id) {

        Code code = codeService.selectById(id);
        model.addAttribute("status", codeService.deleteById(id));

        return list(model, code.getpId());
    }

}
