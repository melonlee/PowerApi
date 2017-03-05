package powerapi.entity;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import powerapi.common.utils.RelativeDateFormat;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;


@TableName("t_project")
public class Project extends BaseEntity {
    
    @TableField(exist = false)
    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:m:s");

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;

    private String title;

    @TableField(value = "host_url")
    private String hostUrl;

    private String description;

    private String version;

    @TableField(value = "user_id")
    private Long userId;

    private String icon;

    private Integer isupdate;

    private String pattern;

    @TableField(exist = false)
    private String relativedate;

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public String getHostUrl() {
        return hostUrl;
    }

    public void setHostUrl(String hostUrl) {
        this.hostUrl = hostUrl == null ? null : hostUrl.trim();
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }

    public String getVersion() {
        return version;
    }

    public void setVersion(String version) {
        this.version = version == null ? null : version.trim();
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public Integer getIsupdate() {
        return isupdate;
    }

    public void setIsupdate(Integer isupdate) {
        this.isupdate = isupdate;
    }

    public String getPattern() {
        return pattern;
    }

    public void setPattern(String pattern) {
        this.pattern = pattern;
    }

    public String getRelativedate() {
        try {
            Date date = format.parse(createdate);
            return RelativeDateFormat.format(date);
        } catch (ParseException e) {
            return "时间异常";
        }
    }
}