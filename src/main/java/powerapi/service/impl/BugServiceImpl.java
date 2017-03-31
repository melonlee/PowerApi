package powerapi.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import powerapi.entity.Bug;
import powerapi.entity.Function;
import powerapi.mapper.BugMapper;
import powerapi.service.BugService;

import java.util.List;

/**
 * Created by Melon on 17/2/22.
 */
@Service
public class BugServiceImpl extends ServiceImpl<BugMapper, Bug> implements BugService {


    public List<Bug> selectByProjectId(Long proId) {
        return this.selectList(new EntityWrapper<Bug>().eq("p_id", proId).orderBy("createdate", false));
    }

    @Override
    public List<Bug> selectUnCloseBugs(Long proId) {
        return this.selectList(new EntityWrapper<Bug>().eq("p_id", proId).eq("status", 0).orderBy("createdate", false));
    }
}
