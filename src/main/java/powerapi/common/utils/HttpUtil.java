package powerapi.common.utils;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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

    public static String doGet(String url, Map<String, String> params) {
        return doGet(url, params, CHARSET);
    }

    public static UnitTest doPost(String url, Map<String, String> params) {
        return doPost(url, params, CHARSET);
    }

    /**
     * HTTP Get 获取内容
     *
     * @param url     请求的url地址 ?之前的地址
     * @param params  请求的参数
     * @param charset 编码格式
     * @return 页面内容
     */
    public static String doGet(String url, Map<String, String> params,
                               String charset) {
        try {
            if (params != null && !params.isEmpty()) {
                List<NameValuePair> pairs = new ArrayList<NameValuePair>(
                        params.size());
                for (Map.Entry<String, String> entry : params.entrySet()) {
                    String value = entry.getValue();
                    if (value != null) {
                        pairs.add(new BasicNameValuePair(entry.getKey(), value));
                    }
                }
                url += "?"
                        + EntityUtils.toString(new UrlEncodedFormEntity(pairs,
                        charset));
            }
            HttpGet httpGet = new HttpGet(url);
            CloseableHttpResponse response = httpClient.execute(httpGet);
            int statusCode = response.getStatusLine().getStatusCode();
            if (statusCode != 200) {
                httpGet.abort();
                throw new RuntimeException("HttpClient,error status code :"
                        + statusCode);
            }
            HttpEntity entity = response.getEntity();
            String result = null;
            if (entity != null) {
                result = EntityUtils.toString(entity, "utf-8");
            }
            EntityUtils.consume(entity);
            response.close();
            return result;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * HTTP Post 获取内容
     *
     * @param url     请求的url地址 ?之前的地址
     * @param params  请求的参数
     * @param charset 编码格式
     * @return 页面内容
     */
    public static UnitTest doPost(String url, Map<String, String> params,
                                  String charset) {

        UnitTest requester = new UnitTest();
        requester.setCreatedate(DateFormatUtil.generateNow());
        requester.setMethod("POST");
        requester.setUrl(url);

        Long requestStart = System.currentTimeMillis();

        try {
            List<NameValuePair> pairs = null;
            if (params != null && !params.isEmpty()) {
                pairs = new ArrayList<NameValuePair>(params.size());
                for (Map.Entry<String, String> entry : params.entrySet()) {
                    String value = entry.getValue();
                    if (value != null) {
                        pairs.add(new BasicNameValuePair(entry.getKey(), value));
                    }
                }
            }
            HttpPost httpPost = new HttpPost(url);
            if (pairs != null && pairs.size() > 0) {
                httpPost.setEntity(new UrlEncodedFormEntity(pairs, CHARSET));
            }
            CloseableHttpResponse response = httpClient.execute(httpPost);
            int statusCode = response.getStatusLine().getStatusCode();

            requester.setResponseCode(statusCode);

            StringBuffer sb = new StringBuffer();

            for (int loop = 0; loop < response.getAllHeaders().length; loop++) {
                BufferedHeader header = (BufferedHeader) response
                        .getAllHeaders()[loop];
                if (header.getName().equals("Accept-Charset")) {
                    continue;
                }
                sb.append(header.getName() + ":" + header.getValue() + "<br/>");

            }
            requester.setResponseHeader(sb.toString());
            HttpEntity entity = response.getEntity();
            String result = null;
            if (entity != null) {
                result = EntityUtils.toString(entity, "utf-8");
                requester.setResponseSize(result.getBytes().length);
                requester.setResponseBody(result);
            }
            EntityUtils.consume(entity);
            response.close();
        } catch (Exception e) {

            requester.setResponseCode(500);
            requester.setResponseHeader(e.getMessage());
            requester.setResponseSize(0);
            requester.setResponseBody("");
        }
        requester.setRequestTime((int) (System.currentTimeMillis() - requestStart));
        return requester;
    }
}
