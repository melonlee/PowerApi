package powerapi.entity;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;

/**
 * Created by Melon on 17/3/2.
 */

@TableName("t_unit_test")
public class UnitTest extends BaseEntity {

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;

    @TableField(value = "user_id")
    private Long userId;

    private String method;

    private String url;

    private String params;

    @TableField(value = "response_code")
    private int responseCode;

    @TableField(value = "response_header")
    private String responseHeader;

    @TableField(value = "response_body")
    private String responseBody;

    @TableField(value = "request_time")
    private int requestTime;// 请求耗时

    @TableField(value = "response_size")
    private int responseSize;// 请求返回内容大小

    @TableField(value = "auto_id")
    private Long autoId;  //标记是否是自动化中的测试内容

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getMethod() {
        return method;
    }

    public void setMethod(String method) {
        this.method = method;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getParams() {
        return params;
    }

    public void setParams(String params) {
        this.params = params;
    }

    public String getResponseHeader() {
        return responseHeader;
    }

    public void setResponseHeader(String responseHeader) {
        this.responseHeader = responseHeader;
    }

    public String getResponseBody() {
        return responseBody;
    }

    public void setResponseBody(String responseBody) {
        this.responseBody = responseBody;
    }

    public Long getAutoId() {
        return autoId;
    }

    public void setAutoId(Long autoId) {
        this.autoId = autoId;
    }

    public int getResponseSize() {
        return responseSize;
    }

    public void setResponseSize(int responseSize) {
        this.responseSize = responseSize;
    }

    public int getRequestTime() {
        return requestTime;
    }

    public void setRequestTime(int requestTime) {
        this.requestTime = requestTime;
    }

    public int getResponseCode() {
        return responseCode;
    }

    public void setResponseCode(int responseCode) {
        this.responseCode = responseCode;
    }

    @Override
    public String toString() {
        return "UnitTest{" +
                "userId=" + userId +
                ", method='" + method + '\'' +
                ", url='" + url + '\'' +
                ", params='" + params + '\'' +
                ", responseCode=" + responseCode +
                ", responseHeader='" + responseHeader + '\'' +
                ", responseBody='" + responseBody + '\'' +
                ", requestTime=" + requestTime +
                ", responseSize=" + responseSize +
                '}';
    }

}
