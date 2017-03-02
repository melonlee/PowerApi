package powerapi.entity;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;

@TableName("t_requester")
public class Requester extends BaseEntity {

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;

    private Integer userId;

    private String method;

    private String url;

    private String params;

    private Integer responseCode;

    private String responseHeader;

    private String responseBody;

    private Integer requestTime;// 请求耗时

    private Integer responseSize;// 请求返回内容大小

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
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

    public Integer getResponseCode() {
        return responseCode;
    }

    public void setResponseCode(Integer responseCode) {
        this.responseCode = responseCode;
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

    public Integer getRequestTime() {
        return requestTime;
    }

    public void setRequestTime(Integer requestTime) {
        this.requestTime = requestTime;
    }

    public Integer getResponseSize() {
        return responseSize;
    }

    public void setResponseSize(Integer responseSize) {
        this.responseSize = responseSize;
    }

    @Override
    public String toString() {
        return "Quicktest [id=" + id + ", userId=" + userId + ", method="
                + method + ", url=" + url + ", params=" + params
                + ", responseCode=" + responseCode + ", responseHeader="
                + responseHeader + ", responseBody=" + responseBody
                + ", createdate=" + createdate + "]";
    }
}
