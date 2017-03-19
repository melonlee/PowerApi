package powerapi.entity;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;

/**
 * Created by Melon on 17/3/2.
 */
@TableName("t_log")
public class Log extends BaseEntity {

    private String action;
    private String resource;

    @TableField(value = "resource_id")
    private Long resourceId;

    @TableField(value = "user_id")
    private Long userId;


    public String getAction() {
        return action;
    }

    public void setAction(String action) {
        this.action = action;
    }

    public String getResource() {
        return resource;
    }

    public void setResource(String resource) {
        this.resource = resource;
    }

    public Long getResourceId() {
        return resourceId;
    }

    public void setResourceId(Long resourceId) {
        this.resourceId = resourceId;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    @Override
    public String toString() {
        return "Log{" +
                "action='" + action + '\'' +
                ", resource='" + resource + '\'' +
                ", resourceId=" + resourceId +
                ", userId=" + userId +
                '}';
    }
}
