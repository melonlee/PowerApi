package powerapi.entity;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;

import java.util.List;

/**
 * Created by Melon on 17/3/2.
 */
@TableName("t_module")
public class Module extends BaseEntity {

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;

    private String title;

    private String url;

    private String description;

    @TableField(value = "p_id")
    private Long pId;

    @TableField(value = "user_id")
    private Long userId;

    private Integer status;

    @TableField(exist = false)
    private List<Function> functions;

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
        setLogResource(this.title);
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Long getpId() {
        return pId;
    }

    public void setpId(Long pId) {
        this.pId = pId;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public List<Function> getFunctions() {
        return functions;
    }

    public void setFunctions(List<Function> functions) {
        this.functions = functions;
    }

    @Override
    public String toString() {
        return "Module{" +
                "title='" + title + '\'' +
                ", url='" + url + '\'' +
                ", description='" + description + '\'' +
                ", pId=" + pId +
                ", userId=" + userId +
                ", status=" + status +
                ", functions=" + functions +
                '}';
    }
}
