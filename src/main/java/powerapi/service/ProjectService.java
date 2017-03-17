package powerapi.service;


import com.baomidou.mybatisplus.service.IService;
import powerapi.entity.Project;

import java.util.List;

/**
 * Created by Melon on 17/2/22.
 */
public interface ProjectService extends IService<Project> {

    List<Project> getProjectList(Long userId, int page);

    Project findProjectById(Long id);

    void deleteProject(Long id);

    void modifyProject(Project project);
}
