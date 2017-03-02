package powerapi.service.impl;


import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import powerapi.entity.Module;
import powerapi.mapper.ModuleMapper;
import powerapi.service.ModuleService;

/**
 * Created by Melon on 17/2/22.
 */
@Service("moduleService")
public class ModuleServiceImpl extends ServiceImpl<ModuleMapper, Module> implements ModuleService {


}
