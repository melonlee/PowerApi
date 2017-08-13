package powerapi.web.controller;


import powerapi.entity.Permission;
import powerapi.entity.Role;
import powerapi.service.PermissionService;
import powerapi.service.RoleService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Melon on 17/2/23.
 */
@Controller
@RequestMapping("/role")
public class RoleController {

    public static final Logger logger = LoggerFactory.getLogger(RoleController.class);

    @Resource
    private RoleService roleService;

    @Resource
    private PermissionService permissionService;


//    @RequiresPermissions("role:view")
    @RequestMapping(value = "/all", method = RequestMethod.GET)
    public String all(ModelMap map) {

        List<Role> roles = roleService.findAll();
        map.addAttribute("roles", roles);
        return "/role/index";
    }

//    @RequiresPermissions("role:create")
    @RequestMapping(value = "/create", method = RequestMethod.GET)
    public String create(ModelMap modelMap) {
        modelMap.addAttribute("role", new Role());
        modelMap.addAttribute("permissions", permissionService.findAll());
        return "/role/detail";
    }

//    @RequiresPermissions("role:view")

    @RequestMapping(value = "/view", method = RequestMethod.GET)
    public String view(ModelMap modelMap,  @RequestParam(value = "id", required = true) Long id) {
        modelMap.addAttribute("role", roleService.findOne(id));
        List<Permission> permissions = permissionService.findByRole(id);
        modelMap.addAttribute("permissions", permissions);
        return "/role/detail";
    }

//    @RequiresPermissions("role:modify")
    @RequestMapping(value = "/modify", method = RequestMethod.POST)
    public String modify(ModelMap modelMap, Role role) {
        if (null != role.getId()) {
            role = roleService.updateRole(role);
            //删除关联关系
            roleService.deletePermissionByRole(role.getId());
        } else {
            role = roleService.createRole(role);
        }

        if (null!=role.getPermissions()&& role.getPermissions().size()>0) {
            for (Long permissionId : role.getPermissions()) {
                roleService.correlationPermissions(role.getId(), permissionId);
            }
        }
        return "redirect:/role/all";
    }

//    @RequiresPermissions("role:delete")
    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public String delete(ModelMap modelMap,
                         @RequestParam(value = "id", required = false, defaultValue = "") Long id) {
        //删除角色
        roleService.deleteRole(id);
        //删除关联关系
        roleService.deletePermissionByRole(id);
        return "redirect:/role/all";
    }
}
