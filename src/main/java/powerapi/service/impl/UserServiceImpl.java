package powerapi.service.impl;


import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import powerapi.entity.User;
import powerapi.mapper.UserMapper;
import powerapi.service.UserService;

import java.util.Set;

/**
 * Created by Melon on 17/2/22.
 */
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements UserService {

    public Set<String> findRoles(String username) {
        return null;
    }

    public Set<String> findPermissions(String username) {
        return null;
    }

    public User findByUsername(String username) {
        return null;
    }
}
