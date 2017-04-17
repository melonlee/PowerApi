package powerapi.service.impl;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import powerapi.common.utils.DateFormatUtil;
import powerapi.common.utils.HttpUtil;
import powerapi.dto.RequestDto;
import powerapi.entity.Function;
import powerapi.entity.Project;
import powerapi.entity.UnitTest;
import powerapi.service.FunctionService;
import powerapi.service.ProjectService;
import powerapi.service.UnitTestService;

import java.util.HashMap;
import java.util.List;

/**
 * 自动化测试
 * <p/>
 * Created by Melon on 2017/4/17.
 */
public class AutoTest extends BaseTest {


    @Autowired
    private ProjectService projectService;


    @Autowired
    private FunctionService functionService;

    @Autowired
    private UnitTestService unitTestService;

    @Test
    public void test() {

        Project project = projectService.findProjectById(25L);

        List<Function> functionList = functionService.selectByProjectId(project.getId());

        RequestDto requestDto;

        powerapi.entity.AutoTest autoBean = new powerapi.entity.AutoTest();
        autoBean.setTitle("#test_" + project.getTitle() + "_" + DateFormatUtil.generateNow());
        autoBean.setUserId(1l);
        autoBean.setId(1l);
        for (Function function : functionList) {

            requestDto = new RequestDto();

            JSONObject paramObject = JSONObject.parseObject(function.getParams());

            requestDto.setMethod(function.getMethod());
            requestDto.setUrl(project.getHostUrl() + function.getModule().getUrl() + function.getUrl());

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
            unitTest.setUserId(1L);
            unitTest.setParams(requestDto.getParams());
            unitTest.setAutoId(autoBean.getId());
            unitTestService.insert(unitTest);
        }

    }

    private HashMap<String, String> getParamsOrHeadersMap(JSONArray array) {
        HashMap<String, String> resultMap = new HashMap<>();
        if (null != array && array.size() > 0) {
            int loop = 0;
            while (loop < array.size()) {
                JSONObject jsonObject = array.getJSONObject(loop);
                resultMap.put(jsonObject.getString("name"), jsonObject.getString("value"));
                loop++;
            }
        }
        return resultMap;
    }
}
