package powerapi.service.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import powerapi.entity.UnitTest;
import powerapi.mapper.UnitTestMapper;
import powerapi.service.UnitTestService;

/**
 * Created by Melon on 17/3/14.
 */
@Service
public class UnitTestServiceImpl extends ServiceImpl<UnitTestMapper, UnitTest> implements UnitTestService {
}
