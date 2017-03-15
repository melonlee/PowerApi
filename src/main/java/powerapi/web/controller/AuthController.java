package powerapi.web.controller;


import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import powerapi.entity.User;
import powerapi.service.UserService;


/**
 * Created by Melon on 17/2/23.
 */
@Controller
@RequestMapping("/auth")
public class AuthController {

    @Autowired
    private UserService userService;


    @RequestMapping(value = "/signin", method = {
            RequestMethod.GET})
    public String signin() {
        return "signin";
    }

    @RequestMapping(value = "/signup", method = {
            RequestMethod.GET})
    public String signup() {
        return "signup";
    }


    @RequestMapping(value = "/signin", method = {
            RequestMethod.POST})
    public String dashboard(ModelMap map, User user) {
        String error = null;
        UsernamePasswordToken token = new UsernamePasswordToken(user.getUsername(), user.getPasswd());
        token.setRememberMe(false);
        try {
            SecurityUtils.getSubject().login(token);
            Subject subject = SecurityUtils.getSubject();
            Session session = subject.getSession();
            session.setAttribute("curUser", userService.findByUsername((String) subject.getPrincipal()));
            return "redirect:/project/all";
        } catch (UnknownAccountException uae) {
            error = "用户名错误!";
        } catch (IncorrectCredentialsException ice) {
            error = "密码错误!";
        } catch (LockedAccountException lae) {
            error = "用户被锁定!";
        }
        map.addAttribute("error", error);
        return "signin";
    }
}
