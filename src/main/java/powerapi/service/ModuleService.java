package powerapi.service;


import com.baomidou.mybatisplus.service.IService;
import powerapi.entity.Module;

import java.util.List;

/**
 * Created by Melon on 17/2/22.
 */
public interface ModuleService extends IService<Module> {

    List<Module> selectByProjectId(Long id);
}
