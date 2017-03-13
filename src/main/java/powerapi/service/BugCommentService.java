package powerapi.service;

import com.baomidou.mybatisplus.service.IService;
import powerapi.entity.BugComment;

import java.util.List;

/**
 * Created by Melon on 17/3/13.
 */
public interface BugCommentService extends IService<BugComment> {
    List<BugComment> findByBugId(Long id);
}
