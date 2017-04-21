package powerapi.plugin.rabbitmq;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.amqp.core.Message;
import org.springframework.amqp.core.MessageListener;
import org.springframework.beans.factory.annotation.Autowired;
import powerapi.common.utils.HttpUtil;
import powerapi.dto.RequestDto;
import powerapi.entity.Function;
import powerapi.entity.Project;
import powerapi.entity.UnitTest;
import powerapi.service.AutoTestService;
import powerapi.service.FunctionService;
import powerapi.service.ProjectService;
import powerapi.service.UnitTestService;

import java.util.HashMap;
import java.util.List;

/**
 * Created by Melon on 2017/4/19.
 */
public class AutoTestWorkConsumer implements MessageListener {

    @Autowired
    private ProjectService projectService;

    @Autowired
    private FunctionService functionService;

    @Autowired
    private AutoTestService autoTestService;

    @Autowired
    private UnitTestService unitTestService;

    private Logger logger = LoggerFactory.getLogger(AutoTestWorkConsumer.class);

    @Override
    public void onMessage(Message message) {


        if (null == message.getBody() || message.getBody().length < 1)
            return;


        JSONObject jsonObject = JSONObject.parseObject(new String(message.getBody()));

        if (null == jsonObject)
            return;

        Long currentTimeMillis = System.currentTimeMillis();

        Project project = projectService.findProjectById(jsonObject.getLong("pId"));

        if (null == project)
            return;

        JSONArray headerJsonArray = JSONObject.parseObject(jsonObject.getString("headers")).getJSONArray("headers");
        HashMap<String, String> headersMap = null;
        if (null != headerJsonArray && headerJsonArray.size() > 0) {
            headersMap = getParamsOrHeadersMap(headerJsonArray);
        }
        List<Function> functionList = functionService.selectByProjectId(project.getId());

        RequestDto requestDto;

        powerapi.entity.AutoTest autoBean = new powerapi.entity.AutoTest();
        autoBean.setTitle("#" + jsonObject.getString("title") + "-" + project.getTitle());
        autoBean.setUserId(jsonObject.getLong("uId"));
        autoBean.setTotalcount(functionList.size());
        autoBean.setpId(project.getId());
        autoTestService.insert(autoBean);
        int errorcount = 0;
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

            /**
             * 提交测试
             */
            UnitTest unitTest = HttpUtil.doRequest(requestDto, paramsMap, headersMap);
            if (unitTest.getResponseCode() != 200) {
                errorcount++;
            }
            unitTest.setUserId(jsonObject.getLong("uId"));
            unitTest.setParams(requestDto.getParams());
            unitTest.setAutoId(autoBean.getId());
            unitTestService.insert(unitTest);
        }
        autoBean.setTotaltime((int) (System.currentTimeMillis() - currentTimeMillis));
        autoBean.setErrorcount(errorcount);
        autoBean.setStatus(1);
        autoTestService.updateById(autoBean);
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
