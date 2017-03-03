package powerapi.service.impl;


import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import powerapi.entity.Project;
import powerapi.mapper.ProjectMapper;
import powerapi.service.ProjectService;

/**
 * Created by Melon on 17/2/22.
 */
@Service
public class ProjectServiceImpl extends ServiceImpl<ProjectMapper,Project> implements ProjectService {


}
