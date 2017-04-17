package powerapi.mapper;


import com.baomidou.mybatisplus.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;
import powerapi.entity.Function;

import java.util.List;

/**
 * Created by Melon on 17/2/22.
 */
public interface FunctionMapper extends BaseMapper<Function> {

    List<Function> selectByProjectId(@Param(value = "pId") Long pId);
}