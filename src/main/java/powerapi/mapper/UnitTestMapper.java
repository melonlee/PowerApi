package powerapi.mapper;


import com.baomidou.mybatisplus.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;
import powerapi.entity.UnitTest;

import java.util.List;

/**
 * Created by Melon on 17/2/22.
 */
public interface UnitTestMapper extends BaseMapper<UnitTest> {

    List<UnitTest> findAutoTestList(@Param(value = "aid") Long aid);
}