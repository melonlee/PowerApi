package powerapi.web.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import powerapi.common.utils.MJsonUtils;
import powerapi.entity.Function;
import powerapi.entity.Module;
import powerapi.entity.Project;
import powerapi.service.FunctionService;
import powerapi.service.ModuleService;
import powerapi.service.ProjectService;


@Controller
@RequestMapping("/function")
public class FunctionController {

    @Resource
    private FunctionService functionService;

    @Resource
    private ModuleService moduleService;

    @Resource
    private ProjectService projectService;

    @ResponseBody
    @RequestMapping(value = "/all", method = RequestMethod.GET)
    public String list(
            @RequestParam(value = "mId", required = true) Long mId) {
        List<Function> list = functionService.selectByModuleId(mId);
        return MJsonUtils.getInstance().setList(list).result();
    }

    @RequestMapping(value = "/view", method = RequestMethod.GET)
    public String view(
            ModelMap model,
            @RequestParam(value = "proId", required = true) Long proId,
            @RequestParam(value = "id", required = false, defaultValue = "0") Long id) {

        Project project = projectService.selectById(proId);
        List<Module> modules = moduleService.selectByProjectId(proId);
        model.addAttribute("modules", modules);
        model.addAttribute("project", project);
        if (id != 0) {
            Function function = functionService.selectById(id);
            model.addAttribute("function", function);
        }
        return "interface/detail";
    }

    @ResponseBody
    @RequestMapping(value = "/modify", method = RequestMethod.POST)
    public String modify(Function function) {
        Integer status = functionService.insertOrUpdate(function) ? 1 : 0;
        return MJsonUtils.getInstance().setStatus(status).result();
    }

    @ResponseBody
    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public String remove(
            @RequestParam(value = "id", required = true) int id) {
        Integer status = functionService.deleteById(id) ? 1 : 0;
        return MJsonUtils.getInstance().setStatus(status).result();
    }

    /**
     * 标记接口
     *
     * @param id
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/tag", method = {RequestMethod.POST,
            RequestMethod.GET})
    public String tag(
            @RequestParam(value = "id", required = false, defaultValue = "0") Long id,
            @RequestParam(value = "status", required = false, defaultValue = "0") int status) {
        Function function = new Function();
        function.setId(id);
        function.setStatus(status);
//        Integer rs = functionService.tag(function);
//
//        return MJsonUtils.getInstance().setStatus(rs).result();
        return null;
    }


    @RequestMapping(value = "/test", method = {RequestMethod.POST,
            RequestMethod.GET})
    public String modify(
            ModelMap model,
            @RequestParam(value = "proId", required = true) Long proId,
            @RequestParam(value = "id", required = true) Long id) {
        Project project = projectService.selectById(proId);
        Function function = functionService.selectById(id);
        Module module = moduleService.selectById(function.getmId());
        function.setUrl(project.getHostUrl() + module.getUrl()
                + function.getUrl() + project.getPattern());
        model.addAttribute("function", function);
        return "interface/test";
    }

}
