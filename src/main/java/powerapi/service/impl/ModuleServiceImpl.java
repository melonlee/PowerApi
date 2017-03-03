package powerapi.service.impl;


import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import powerapi.entity.Module;
import powerapi.mapper.ModuleMapper;
import powerapi.service.ModuleService;

import java.util.List;

/**
 * Created by Melon on 17/2/22.
 */
@Service
public class ModuleServiceImpl extends ServiceImpl<ModuleMapper, Module> implements ModuleService {


    public List<Module> selectByProjectId(Long projectId) {
        return this.selectList(new EntityWrapper<Module>().eq("p_id", projectId));
    }
}
