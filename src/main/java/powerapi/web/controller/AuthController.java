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
import powerapi.plugin.PasswordHelper;
import powerapi.service.UserService;


/**
 * Created by Melon on 17/2/23.
 */
@Controller
@RequestMapping("/auth")
public class AuthController extends BaseController {

    @Autowired
    private UserService userService;

    @Autowired
    private PasswordHelper passwordHelper;


    @RequestMapping(value = "/signin", method = {
            RequestMethod.GET})
    public String signin() {
        return "signin";
    }

    @RequestMapping(value = "/signup", method = {
            RequestMethod.GET})
    public String signupview() {
        return "signup";
    }

    @RequestMapping(value = "/signin", method = {
            RequestMethod.POST})
    public String signin(ModelMap map, User user) {
        String error;
        UsernamePasswordToken token = new UsernamePasswordToken(user.getUsername(), user.getPasswd());
        token.setRememberMe(false);
        try {
            Subject subject = SecurityUtils.getSubject();
            subject.login(token);
            subject.getSession().setAttribute("curUser", userService.findByUsername((String) subject.getPrincipal()));
            return "redirect:/dashboard/console";
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

    @RequestMapping(value = "/signup", method = {
            RequestMethod.POST})
    public String signup(User user, ModelMap map) {
        //检查用户名是否被注册
        User temp = userService.findByUsername(user.getUsername());
        if (null == temp) {
            //注册
            String passwdTemp = user.getPasswd();
            passwordHelper.encryptPassword(user);
            userService.insert(user);
            //登录到shiro中
            UsernamePasswordToken token = new UsernamePasswordToken(user.getUsername(), passwdTemp);
            token.setRememberMe(false);
            Subject subject = SecurityUtils.getSubject();
            subject.login(token);
            subject.getSession().setAttribute("curUser", user);
            return "redirect:/dashboard/console";
        } else {
            map.addAttribute("error", "用户名已经被占用!");
            return "signup";
        }
    }

}
