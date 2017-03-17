package powerapi.web.controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import powerapi.common.utils.HttpUtils;
import powerapi.common.utils.JsonUtils;
import powerapi.dto.RequestDto;
import powerapi.dto.RequestParamDto;
import powerapi.entity.UnitTest;
import powerapi.service.UnitTestService;

import javax.annotation.Resource;
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
        JSONArray params = paramObject.getJSONArray("params");
        RequestParamDto paramDto;
        HashMap<String, String> paramsMap = new HashMap<String, String>();
        int loop = 0;
        while (loop < params.size()) {
            JSONObject paramJson = params.getJSONObject(loop);
            paramDto = new RequestParamDto();
            paramDto.setName(paramJson.getString("name"));
            paramDto.setType(paramJson.getString("type"));
            paramDto.setValue(paramJson.getString("value"));
            paramsMap.put(paramDto.getName(), paramDto.getValue());
            loop++;
        }
        UnitTest unitTest = HttpUtils.doPost(requestDto.getUrl(), paramsMap);
        unitTest.setUserId(getCurrentUser().getId());
        unitTest.setParams(requestDto.getParams());
        unitTestService.insert(unitTest);
        return JsonUtils.getInstance().setBean(unitTest, null != unitTest.getId() ? 1 : 0)
                .result();
    }
}
