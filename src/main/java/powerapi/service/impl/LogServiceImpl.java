package powerapi.service.impl;


import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import powerapi.entity.Log;
import powerapi.mapper.LogMapper;
import powerapi.service.LogService;

/**
 * Created by Melon on 17/2/22.
 */
@Service("logService")
public class LogServiceImpl extends ServiceImpl<LogMapper,Log> implements LogService {


}
