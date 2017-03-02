package powerapi.web.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;
import powerapi.entity.User;
import powerapi.service.UserService;


@Controller
public class UserController {

    @Resource
    private UserService userService;

    @Resource
    private DashboardController dashboardController;

    @RequestMapping(value = "signin", method = {RequestMethod.POST,
            RequestMethod.GET})
    public ModelAndView signin(ModelMap model, User user,
                               HttpSession httpSession) {

//        if (null != user.getPasswd())
//            user.setPasswd(MStringUtils.MD5(user.getPasswd()));
//
//        System.out.println(user.toString());
//
//        User curUser = userService.signin(user);
//
//
//        if (null != curUser && null != curUser.getId()) {
//            httpSession.setAttribute("curUser", curUser);
//            httpSession.setMaxInactiveInterval(60 * 60); // 1小时
//            // return dashboardController.list(model, httpSession);
//            return new ModelAndView(new RedirectView("dashboard/console.do"));
//        } else {
//            // model.addAttribute("status", 0);
//            // return "signin";
//            return new ModelAndView(new RedirectView("signin_view.do?status=0"));
//        }
        return null;
    }

    @RequestMapping(value = "signup", method = {RequestMethod.POST,
            RequestMethod.GET})
    public ModelAndView signup(ModelMap model, User user,
                               HttpSession httpSession) {

//        Integer status = userService.signup(user);
//
//        if (status > 0) {
//            httpSession.setAttribute("curUser", user);
//            httpSession.setMaxInactiveInterval(60 * 60); // 1小时
//            return new ModelAndView(new RedirectView("dashboard/console.do"));
//        } else {
//            model.addAttribute("status", status);
//            return new ModelAndView(new RedirectView("signin_view.do?status="
//                    + status));
//        }
        return null;
    }

    @RequestMapping(value = "signin_view", method = {RequestMethod.POST,
            RequestMethod.GET})
    public String signin_view() {

        return "signin";
    }

    @RequestMapping(value = "signout", method = {RequestMethod.POST,
            RequestMethod.GET})
    public String signout(HttpSession httpSession) {

        httpSession.removeAttribute("curUser");

        return "signin";
    }

    @RequestMapping(value = "signup_view", method = {RequestMethod.POST,
            RequestMethod.GET})
    public String signup_view() {

        return "signup";
    }

}
