package powerapi.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import powerapi.common.utils.EndecryptUtil;
import powerapi.common.utils.JsonUtil;
import powerapi.entity.Function;
import powerapi.entity.Module;
import powerapi.service.FunctionService;
import powerapi.service.ModuleService;
import org.springframework.stereotype.Controller;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Melon on 17/3/23.
 */
@Controller
public class ShareController extends BaseController {

    @Autowired
    private ModuleService moduleService;

    @Autowired
    private FunctionService functionService;

    @RequestMapping(value = "/{code}", method = RequestMethod.GET)
    public String preview(ModelMap model, @PathVariable("code") String code) {
        String projectCode = EndecryptUtil.decryptBase64(code);
        Long projectId = Long.parseLong(projectCode.substring(6));
        model.addAttribute("project", getProject(projectId));
        return "project/doc";
    }


    @ResponseBody
    @RequestMapping(value = "/{code}", method = RequestMethod.POST)
    public String preview(@PathVariable("code") String code) {
        String projectCode = EndecryptUtil.decryptBase64(code);
        Long projectId = Long.parseLong(projectCode.substring(6));
        List<Module> modules = moduleService.selectByProjectId(projectId);
        List<Module> modulesAndFunctions = new ArrayList<>();
        for (Module module : modules) {
            List<Function> functions = functionService.selectByModuleId(module.getId());
            module.setFunctions(functions);
            modulesAndFunctions.add(module);
        }

        System.out.println("datas--->" + JsonUtil.getInstance().setList(modulesAndFunctions).result());

        return JsonUtil.getInstance().setList(modulesAndFunctions).result();
    }

}
