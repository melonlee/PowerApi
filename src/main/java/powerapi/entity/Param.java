package powerapi.entity;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;

public class Param extends BaseEntity {

    private static final long serialVersionUID = 1L;

    private String name;

    private String type;

    private String value;
    
    private Integer quickId;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public Integer getQuickId() {
        return quickId;
    }

    public void setQuickId(Integer quickId) {
        this.quickId = quickId;
    }


}
