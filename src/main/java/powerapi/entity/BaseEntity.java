package powerapi.entity;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.enums.IdType;
import powerapi.common.utils.DateFormatUtil;

import java.util.Date;


/**
 * Created by Melon on 17/3/2.
 */
public class BaseEntity {

    @TableId(type = IdType.AUTO)
    protected Long id;
    protected String createdate;

    @TableField(exist = false)
    protected String logResource;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getCreatedate() {
        return createdate;
    }

    public void setCreatedate(String createdate) {
        this.createdate = createdate;
    }

    public String getLogResource() {
        return logResource;
    }

    public void setLogResource(String logResource) {
        this.logResource = logResource;
    }

    public String getRelativedate() {
        return DateFormatUtil.getRelativeDate(createdate);
    }
}
