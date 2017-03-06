package powerapi.web.controller;

import java.lang.reflect.InvocationTargetException;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import powerapi.entity.Quicktest;
import powerapi.entity.User;


@Controller
@RequestMapping("quick")
public class QuicktestController {


    private User user;

    @RequestMapping(value = "view", method = {RequestMethod.POST,
            RequestMethod.GET})
    public String view(ModelMap modelMap, HttpSession session) {

        // 加载历史记录

        user = (User) session.getAttribute("curUser");
//		ArrayList<Requester> list = quicktestService.history(user.getId());
//
//		modelMap.addAttribute("list", list);

        return "quicktest";
    }

    @ResponseBody
    @RequestMapping(value = "remove", method = {RequestMethod.POST,
            RequestMethod.GET})
    public String remove(
            @RequestParam(value = "id", required = false, defaultValue = "0") int id) {

//		Integer status = quicktestService.remove(id);
//		return JsonUtils.getInstance().setStatus(status).result();
        return null;
    }

    @ResponseBody
    @RequestMapping(value = "info", method = {RequestMethod.POST,
            RequestMethod.GET})
    public String info(
            @RequestParam(value = "id", required = false, defaultValue = "0") int id) {

//		Requester requester = quicktestService.info(id);
//
//		return JsonUtils.getInstance().setBean(requester, requester.getId())
//				.result();
        return null;
    }

    @ResponseBody
    @RequestMapping(value = "test", method = {RequestMethod.POST,
            RequestMethod.GET})
    public String test(ModelMap modelMap, Quicktest quicktest,
                       HttpSession session) throws IllegalAccessException,
            InvocationTargetException {

//		JSONObject paramObject = new JSONObject(quicktest.getParams());
//
//		JSONArray params = paramObject.getJSONArray("params");
//
//		Param param;
//
//		HashMap<String, String> paramsMap = new HashMap<>();
//		for (int loop = 0; loop < params.length(); loop++) {
//
//			JSONObject paramJson = params.getJSONObject(loop);
//
//			param = new Param();
//			param.setName(paramJson.getString("name"));
//			param.setType(paramJson.getString("type"));
//			param.setValue(paramJson.getString("value"));
//
//			paramsMap.put(param.getName(), param.getValue());
//		}
//
//		Requester requester = MHttpUtils.doPost(quicktest.getUrl(), paramsMap);
//		user = (User) session.getAttribute("curUser");
//		requester.setUserId(user.getId());
//		requester.setParams(quicktest.getParams());
//		quicktestService.saveTest(requester);
//		return JsonUtils.getInstance().setBean(requester, requester.getId())
//				.result();
        return null;
    }

}
