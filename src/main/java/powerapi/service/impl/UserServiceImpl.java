package powerapi.service.impl;


import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import powerapi.entity.User;
import powerapi.mapper.RoleMapper;
import powerapi.mapper.UserMapper;
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
}
