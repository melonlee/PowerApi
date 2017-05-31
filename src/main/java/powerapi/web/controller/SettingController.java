package powerapi.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by Melon on 2017/5/31.
 */
@Controller
@RequestMapping("/setting")
public class SettingController {

    @RequestMapping(value = "/all", method = RequestMethod.GET)
    public String all(ModelMap model) {
        return "setting/index";
    }
}
