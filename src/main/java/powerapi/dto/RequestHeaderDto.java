package powerapi.dto;

/**
 * 前端进行接口请求访问的Header内容DTO模型
 * <p/>
 * Created by Melon on 17/3/2.
 */
public class RequestHeaderDto {

    private String name;

    private String value;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

}
