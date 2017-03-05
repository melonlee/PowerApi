package powerapi.service;


import com.baomidou.mybatisplus.service.IService;
import powerapi.entity.Function;

import java.util.List;

/**
 * Created by Melon on 17/2/22.
 */
public interface FunctionService extends IService<Function> {

    List<Function> selectByModuleId(Long mId);
}
