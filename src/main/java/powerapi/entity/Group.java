package powerapi.entity;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;

import java.text.SimpleDateFormat;

/**
 * Created by Melon on 17/3/17.
 */
@TableName("t_bug")
public class Group {
    public SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:m:s");
    @TableId(type = IdType.AUTO)
    private long id;
    private String title;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }
}
