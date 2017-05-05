package powerapi.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import powerapi.entity.AutoTest;
import powerapi.entity.UnitTest;
import powerapi.mapper.UnitTestMapper;
import powerapi.service.UnitTestService;

import java.util.List;

/**
 * Created by Melon on 17/3/14.
 */
@Service
public class UnitTestServiceImpl extends ServiceImpl<UnitTestMapper, UnitTest> implements UnitTestService {
    @Override
    public List<UnitTest> findAutoTestList(Long aid) {
        return this.selectList(new EntityWrapper<UnitTest>().eq("auto_id", aid).orderBy("response_code", false));
    }
}
