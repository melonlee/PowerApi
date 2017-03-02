package powerapi.web.controller;


import powerapi.entity.Permission;
import powerapi.service.PermissionService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;

/**
 * 1.权限CRUD
 * Created by Melon on 17/2/23.
 */
@Controller
@RequestMapping("permission")
public class PermissionController {

    @Resource
    private PermissionService permissionService;

    @RequiresPermissions("permission:view")
    @RequestMapping(value = "/all", method = RequestMethod.GET)
    public String all(ModelMap modelMap) {

        modelMap.addAttribute("permissions", permissionService.findAll());
        return "/permission/index.ftl";
    }

    @RequiresPermissions("permission:modify")
    @RequestMapping(value = "/modify", method = RequestMethod.POST)
    public String modify(ModelMap modelMap, Permission p) {
        if (null != p.getId()) {
            permissionService.updatePermission(p);
        } else {
            permissionService.createPermission(p);
        }
        return "redirect:/permission/all";
    }

    @RequiresPermissions("permission:delete")
    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public String delete(ModelMap modelMap,
                         @RequestParam(value = "id", required = false, defaultValue = "") Long id) {
        permissionService.deletePermission(id);
        return "redirect:/permission/all";
    }

}
