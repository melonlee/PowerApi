package powerapi.web.controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import powerapi.common.utils.HttpUtil;
import powerapi.common.utils.JsonUtil;
import powerapi.dto.RequestDto;
import powerapi.entity.UnitTest;
import powerapi.service.UnitTestService;

import java.lang.reflect.InvocationTargetException;
import java.util.HashMap;

/**
 * 单元测试类
 * Created by Melon on 17/3/14.
 */

@Controller
@RequestMapping("/unit")
public class UnitTestController extends BaseController {

    @Autowired
    private UnitTestService unitTestService;

    @RequestMapping("/view")
    public String view() {
        return "/test/unit";
    }

    @ResponseBody
    @RequestMapping(value = "/test", method = RequestMethod.POST)
    public String test(RequestDto requestDto) throws IllegalAccessException,
            InvocationTargetException {

        JSONObject paramObject = JSONObject.parseObject(requestDto.getParams());

        /**
         * 解析header
         * 解析参数
         *
         */
        HashMap<String, String> paramsMap = getParamsOrHeadersMap(paramObject.getJSONArray("params"));
        HashMap<String, String> headersMap = getParamsOrHeadersMap(paramObject.getJSONArray("headers"));

        /**
         * 提交测试
         */
        UnitTest unitTest = HttpUtil.doRequest(requestDto, paramsMap, headersMap);
        unitTest.setUserId(getCurrentUser().getId());
        unitTest.setParams(requestDto.getParams());
        unitTestService.insert(unitTest);
        return JsonUtil.getInstance().setBean(unitTest, null != unitTest.getId() ? 1 : 0)
                .result();
    }

    private HashMap<String, String> getParamsOrHeadersMap(JSONArray array) {
        HashMap<String, String> resultMap = new HashMap<>();
        int loop = 0;
        while (loop < array.size()) {
            JSONObject jsonObject = array.getJSONObject(loop);
            resultMap.put(jsonObject.getString("name"), jsonObject.getString("value"));
            loop++;
        }
        return resultMap;
    }
}
