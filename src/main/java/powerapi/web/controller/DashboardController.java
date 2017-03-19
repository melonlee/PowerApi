package powerapi.web.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

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
//		ArrayList<LogAnno> list = logService.logs(user.getId());
//		modelMap.addAttribute("list", list);
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

    @RequestMapping(value = "changepwd", method = {RequestMethod.POST,
            RequestMethod.GET})
    public String changepwd(ModelMap modelMap, HttpSession session) {
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
        return "dashboard";
    }
}
