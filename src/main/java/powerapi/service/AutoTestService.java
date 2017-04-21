package powerapi.service;

import com.baomidou.mybatisplus.service.IService;
import powerapi.entity.AutoTest;

import java.util.List;

/**
 * Created by Melon on 2017/4/18.
 */
public interface AutoTestService extends IService<AutoTest> {
    List<AutoTest> findFinishedTest(Long userId);

    List<AutoTest> findTesting(Long id);
}
