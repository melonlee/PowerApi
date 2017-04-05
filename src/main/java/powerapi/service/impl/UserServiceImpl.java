package powerapi.service.impl;


import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import powerapi.dto.DashboardDto;
import powerapi.entity.Bug;
import powerapi.entity.Code;
import powerapi.entity.Project;
import powerapi.entity.User;
import powerapi.mapper.*;
import powerapi.service.UserService;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Set;

/**
 * Created by Melon on 17/2/22.
 */
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements UserService {

    @Resource
    private UserMapper userMapper;

    @Resource
    private ProjectMapper projectMapper;

    @Resource
    private BugMapper bugMapper;

    @Resource
    private CodeMapper codeMapper;

    @Resource
    private FunctionMapper functionMapper;

    @Resource
    private ModuleMapper moduleMapper;

    public Set<String> findRoles(String username) {
        ArrayList<String> roles = userMapper.findRoles(username);
        return new HashSet<String>(roles);
    }

    public Set<String> findPermissions(String username) {
        ArrayList<String> permissions = userMapper.findPermissions(username);
        return new HashSet<String>(permissions);
    }

    public User findByUsername(String username) {

        return userMapper.findByName(username);
    }

    @Override
    public DashboardDto dasboardData(Long userId) {
        DashboardDto dashboardDto = new DashboardDto();
        dashboardDto.setProjectCount(projectMapper.selectCount(new EntityWrapper<Project>().eq("user_id", userId)));
        dashboardDto.setBugCount(bugMapper.selectCount(new EntityWrapper<Bug>().eq("user_id", userId)));
        dashboardDto.setCodeCount(codeMapper.selectCount(new EntityWrapper<Code>().eq("user_id", userId)));
        dashboardDto.setInterfaceCount(functionMapper.selectCountSql("select count(t_function.id) from t_function where t_function.m_id in (select t_module.id from t_module where t_module.user_id=" + userId + ")"));
        return dashboardDto;
    }
}
