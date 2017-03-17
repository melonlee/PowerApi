package powerapi.web.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import powerapi.entity.User;
import powerapi.service.*;


@Controller
@RequestMapping("dashboard")
public class DashboardController {

    @Resource
    private LogService logService;

    @Resource
    private UserService userService;


    @Resource
    private ProjectService projectService;

    @Resource
    private FunctionService functionService;

    @Resource
    private BugService bugService;

    private User user;

    @RequestMapping(value = "console", method = {RequestMethod.POST,
            RequestMethod.GET})
    public String list(ModelMap modelMap, HttpSession session) {
        user = (User) session.getAttribute("curUser");
//		ArrayList<LogAnno> list = logService.logs(user.getId());
//		modelMap.addAttribute("list", list);

        // 获取各项数据

        //	Integer testCount = quicktestService.count(user.getId());
        modelMap.addAttribute("testCount", 1);

        //	Integer proCount = projectService.count(user.getId());
        modelMap.addAttribute("proCount", 2);

        //	Integer bugCount = bugService.count(user.getId());
        modelMap.addAttribute("bugCount", 3);
        return "dashboard";
    }

    @RequestMapping(value = "changepwd", method = {RequestMethod.POST,
            RequestMethod.GET})
    public String changepwd(ModelMap modelMap, HttpSession session) {
        user = (User) session.getAttribute("curUser");
        modelMap.addAttribute("user", user);
        return "account/account";
    }

    @RequestMapping(value = "change", method = {RequestMethod.POST,
            RequestMethod.GET})
    public String change(
            ModelMap modelMap,
            HttpSession session,
            @RequestParam(value = "passwdnew", required = false, defaultValue = "") String passwdnew) {

//        passwdnew = MStringUtils.MD5(passwdnew);
//
//        Integer status = userService.changePwd(user, passwdnew);
        Integer status = 1;
        if (status > 0) {
            user.setPasswd(passwdnew);
            session.setAttribute("curUser", user);
        }
        modelMap.addAttribute("status", status);
        return "dashboard";
    }
}
