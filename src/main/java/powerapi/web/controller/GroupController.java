package powerapi.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import powerapi.entity.Group;
import powerapi.service.GroupService;

import java.util.List;

/**
 * Created by Melon on 2017/5/31.
 */
@Controller
@RequestMapping("/group")
public class GroupController extends BaseController {

    @Autowired
    private GroupService groupService;

    @RequestMapping(value = "/all", method = RequestMethod.GET)
    public String all(ModelMap model) {

        List<Group> groups = groupService.selectByUserId(getCurrentUser().getId());
        model.addAttribute("groups", groups);
        return "group/index";
    }

    @RequestMapping(value = "/create", method = RequestMethod.GET)
    public String create(@ModelAttribute Group group) {
        return "group/detail";
    }

    @RequestMapping(value = "/modify", method = RequestMethod.POST)
    public String submit(@ModelAttribute Group group) {
        group.setUserId(getCurrentUser().getId());
        groupService.insertOrUpdate(group);
        return "redirect:/group/all";
    }

    @RequestMapping(value = "/view", method = RequestMethod.GET)
    public String basic(@ModelAttribute Group group) {
        group = groupService.selectById(group.getId());
        return "group/detail";
    }

    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public String remove(@ModelAttribute Group group) {
        groupService.deleteById(group.getId());
        return "redirect:/code/all?";
    }

}
