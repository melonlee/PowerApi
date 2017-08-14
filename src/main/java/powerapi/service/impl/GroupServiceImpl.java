package powerapi.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import powerapi.entity.Group;
import powerapi.mapper.GroupMapper;
import powerapi.service.GroupService;

import java.util.List;

/**
 * Created by Melon on 2017/8/14.
 */
@Service
public class GroupServiceImpl extends ServiceImpl<GroupMapper, Group> implements GroupService {
    @Override
    public List<Group> selectByUserId(Long userId) {
        return this.selectList(new EntityWrapper<Group>().eq("user_id", userId));
    }
}
