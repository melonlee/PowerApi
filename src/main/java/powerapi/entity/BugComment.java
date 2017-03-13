package powerapi.entity;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;

/**
 * Created by Melon on 17/3/13.
 */

@TableName("t_bug_comment")
public class BugComment extends BaseEntity {

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;

    private String content;

    @TableField(value = "b_id")
    private Long bugId;

    @TableField(value = "user_id")
    private Long userId;

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Long getBugId() {
        return bugId;
    }

    public void setBugId(Long bugId) {
        this.bugId = bugId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}
