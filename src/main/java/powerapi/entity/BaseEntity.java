package powerapi.entity;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.enums.IdType;


/**
 * Created by Melon on 17/3/2.
 */
public class BaseEntity {

    @TableId(type = IdType.AUTO)
    protected Long id;
    protected String createdate;

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
}
