package powerapi.web.controller;


import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import powerapi.entity.Log;
import powerapi.entity.User;
import powerapi.service.*;

import java.util.List;


@Controller
@RequestMapping("/dashboard")
public class DashboardController extends BaseController {

    @Autowired
    private LogService logService;

    @RequestMapping(value = "/console", method = RequestMethod.GET)
    public String list(ModelMap modelMap) {
        // 获取各项数据
        //	Integer testCount = quicktestService.count(user.getId());
        modelMap.addAttribute("testCount", 1);
        //	Integer proCount = projectService.count(user.getId());
        modelMap.addAttribute("proCount", 2);
        //	Integer bugCount = bugService.count(user.getId());
        modelMap.addAttribute("bugCount", 3);
        List<Log> logs = logService.findLogByUser(getCurrentUser().getId());
        modelMap.addAttribute("logs", logs);
        return "dashboard";
    }

    /**
     * 退出登录,清除缓存之类
     *
     * @return
     */
    @RequestMapping(value = "/signout", method = {
            RequestMethod.GET})
    public String signout() {
        SecurityUtils.getSubject().logout();
        return "signin";
    }

    @RequestMapping(value = "/changepwd", method = {
            RequestMethod.GET})
    public String changepwd(ModelMap map) {
        map.addAttribute("user", getCurrentUser());
        return "account/changepwd";
    }

    @RequestMapping(value = "changepwd", method = RequestMethod.POST)
    public String change(User user,
                         @RequestParam(value = "passwdnew", required = true) String passwdnew) {

//        passwdnew = MStringUtils.MD5(passwdnew);
//
//        Integer status = userService.changePwd(user, passwdnew);
        return "dashboard";
    }
}
