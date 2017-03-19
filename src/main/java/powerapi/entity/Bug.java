package powerapi.entity;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;

/**
 * Created by Melon on 17/3/2.
 */
@TableName("t_bug")
public class Bug extends BaseEntity {

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;

    private String title;

    private String description;

    private Integer status;

    @TableField(value = "p_id")
    private Long pId;

    @TableField(value = "user_id")
    private Long userId;

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
        setLogResource(this.title);
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
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
}
