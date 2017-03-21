package powerapi.service;


import com.baomidou.mybatisplus.service.IService;
import powerapi.entity.Log;

import java.util.List;

/**
 * Created by Melon on 17/2/22.
 */
public interface LogService extends IService<Log> {


    List<Log> findLogByUser(Long id, int page);
}
