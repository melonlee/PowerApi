package powerapi.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Melon on 17/3/14.
 */
@Controller
@RequestMapping("/auto")
public class AutoTestController {

    @RequestMapping("/view")
    public String view() {
        return "/test/auto";
    }
}
