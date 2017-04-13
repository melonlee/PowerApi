package powerapi.common.utils;

import java.io.IOException;
import java.util.*;

import org.apache.http.HttpEntity;
import org.apache.http.NameValuePair;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.message.BufferedHeader;
import org.apache.http.util.EntityUtils;
import powerapi.dto.RequestDto;
import powerapi.entity.UnitTest;

/**
 * Created by Melon on 17/3/6.
 */
public class HttpUtil {

    private static final CloseableHttpClient httpClient;

    public static final String CHARSET = "UTF-8";

    static {
        RequestConfig config = RequestConfig.custom().setConnectTimeout(60000)
                .setSocketTimeout(15000).build();
        httpClient = HttpClientBuilder.create().setDefaultRequestConfig(config)
                .build();
    }


    public static UnitTest doRequest(RequestDto requestDto, Map<String, String> params, Map<String, String> headers) {

        /**
         * 构建返回结果模型
         *
         */
        UnitTest unitTest = new UnitTest();
        unitTest.setCreatedate(DateFormatUtil.generateNow());
        unitTest.setMethod(requestDto.getMethod());
        unitTest.setUrl(requestDto.getUrl());

        Long requestStart = System.currentTimeMillis();
        CloseableHttpResponse response;
        try {
            response = getCloseableHttpResponse(params, headers, requestDto);
            doResponse(unitTest, response);
        } catch (Exception e) {
            unitTest.setResponseCode(500);
            unitTest.setResponseHeader(e.getMessage());
            unitTest.setResponseSize(0);
            unitTest.setResponseBody("");
        }
        unitTest.setRequestTime((int) (System.currentTimeMillis() - requestStart));
        return unitTest;
    }

    /**
     * 处理返回结果数据
     *
     * @param unitTest
     * @param response
     * @throws IOException
     */
    private static void doResponse(UnitTest unitTest, CloseableHttpResponse response) throws IOException {
        int statusCode = response.getStatusLine().getStatusCode();
        unitTest.setResponseCode(statusCode);
        StringBuffer sb = new StringBuffer();
        for (int loop = 0; loop < response.getAllHeaders().length; loop++) {
            BufferedHeader header = (BufferedHeader) response
                    .getAllHeaders()[loop];
            if (header.getName().equals("Accept-Charset")) {
                continue;
            }
            sb.append(header.getName() + ":" + header.getValue() + "<br/>");
        }
        unitTest.setResponseHeader(sb.toString());
        HttpEntity entity = response.getEntity();
        String result;
        if (entity != null) {
            result = EntityUtils.toString(entity, "utf-8");
            unitTest.setResponseSize(result.getBytes().length);
            unitTest.setResponseBody(result);
        }
        EntityUtils.consume(entity);
        response.close();
    }


    /**
     * 根据不同请求方式获取response
     *
     * @param paramsMap
     * @param headersMap
     * @param requestDto
     * @return
     * @throws IOException
     */
    private static CloseableHttpResponse getCloseableHttpResponse(Map<String, String> paramsMap, Map<String, String> headersMap, RequestDto requestDto) throws IOException {
        CloseableHttpResponse response;
        String url = requestDto.getUrl();
        String method = requestDto.getMethod().toLowerCase();
        List<NameValuePair> pairs = null;
        /**
         *
         * 获取参数
         */
        if (paramsMap != null && !paramsMap.isEmpty()) {
            pairs = new ArrayList<>(
                    paramsMap.size());
            for (Map.Entry<String, String> entry : paramsMap.entrySet()) {
                String value = entry.getValue();
                if (value != null) {
                    pairs.add(new BasicNameValuePair(entry.getKey(), value));
                }
            }
        }

        //创建对应实例
        if (method.equals("post")) {
            HttpPost httpPost = new HttpPost(url);
            if (null != pairs && pairs.size() > 0) {
                httpPost.setEntity(new UrlEncodedFormEntity(pairs, CHARSET));
            }
            if (null != headersMap && headersMap.size() > 0) {
                Set<String> keys = headersMap.keySet();
                Iterator<String> iterator = keys.iterator();
                while (iterator.hasNext()) {
                    String key = iterator.next();
                    httpPost.setHeader(key, headersMap.get(key));
                }
            }
            response = httpClient.execute(httpPost);
        } else {
            if (null != pairs && pairs.size() > 0) {
                url += "?"
                        + EntityUtils.toString(new UrlEncodedFormEntity(pairs,
                        CHARSET));
            }
            HttpGet httpGet = new HttpGet(url);
            if (null != headersMap && headersMap.size() > 0) {
                Set<String> keys = headersMap.keySet();
                Iterator<String> iterator = keys.iterator();
                while (iterator.hasNext()) {
                    String key = iterator.next();
                    httpGet.setHeader(key, headersMap.get(key));
                }
            }
            response = httpClient.execute(httpGet);
        }

        return response;
    }

}
