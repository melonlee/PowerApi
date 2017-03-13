package powerapi.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import powerapi.entity.Bug;
import powerapi.entity.BugComment;
import powerapi.mapper.BugCommentMapper;
import powerapi.service.BugCommentService;

import java.util.List;

/**
 * Created by Melon on 17/3/13.
 */
@Service
public class BugCommentServiceImpl extends ServiceImpl<BugCommentMapper, BugComment> implements BugCommentService {
    public List<BugComment> findByBugId(Long id) {
        return this.selectList(new EntityWrapper<BugComment>().eq("b_id", id));
    }
}
