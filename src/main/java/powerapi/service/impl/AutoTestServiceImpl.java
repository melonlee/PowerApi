package powerapi.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import powerapi.entity.AutoTest;
import powerapi.mapper.AutoTestMapper;
import powerapi.service.AutoTestService;

import java.util.List;

/**
 * Created by Melon on 2017/4/18.
 */
@Service
public class AutoTestServiceImpl extends ServiceImpl<AutoTestMapper, AutoTest> implements AutoTestService {
    @Override
    public List<AutoTest> findFinishedTest(Long userId) {
        return this.selectList(new EntityWrapper<AutoTest>().eq("status", 1).eq("user_id", userId).orderBy("createdate", false));
    }
}
