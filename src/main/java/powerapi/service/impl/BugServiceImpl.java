package powerapi.service.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import powerapi.entity.Bug;
import powerapi.mapper.BugMapper;
import powerapi.service.BugService;

/**
 * Created by Melon on 17/2/22.
 */
@Service
public class BugServiceImpl extends ServiceImpl<BugMapper, Bug> implements BugService {


}
