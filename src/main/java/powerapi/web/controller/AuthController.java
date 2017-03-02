package powerapi.web.controller;


import org.apache.ibatis.type.JdbcType;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import powerapi.entity.User;

/**
 * Created by Melon on 17/2/23.
 */
@Controller
@RequestMapping("/auth")
public class AuthController {


    @RequestMapping(method = {
            RequestMethod.GET})
    public String view() {
        return "login.ftl";
    }

    @RequestMapping(value = "/login", method = {
            RequestMethod.POST})
    public String dashboard(ModelMap map, User admin) {
        String error = null;
        UsernamePasswordToken token = new UsernamePasswordToken(admin.getUsername(), admin.getPasswd());
        token.setRememberMe(false);
        try {
            SecurityUtils.getSubject().login(token);
            return "redirect:/video/all";
        } catch (UnknownAccountException uae) {
            error = "用户名错误!";
        } catch (IncorrectCredentialsException ice) {
            error = "密码错误!";
        } catch (LockedAccountException lae) {
            error = "用户被锁定!";
        }
        map.addAttribute("error", error);
        return "login.ftl";
    }
}
