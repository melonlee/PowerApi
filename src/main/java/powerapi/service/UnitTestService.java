package powerapi.service;

import com.baomidou.mybatisplus.service.IService;
import powerapi.entity.UnitTest;

import java.util.List;

/**
 * Created by Melon on 17/3/14.
 */
public interface UnitTestService extends IService<UnitTest> {
    List<UnitTest> findAutoTestList(Long id);
}
