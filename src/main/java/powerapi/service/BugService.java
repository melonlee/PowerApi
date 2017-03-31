package powerapi.service;

import com.baomidou.mybatisplus.service.IService;
import powerapi.entity.Bug;

import java.util.List;

/**
 * Created by Melon on 17/2/22.
 */
public interface BugService extends IService<Bug> {

    List<Bug> selectByProjectId(Long proId);

    List<Bug> selectUnCloseBugs(Long projectId);
}
