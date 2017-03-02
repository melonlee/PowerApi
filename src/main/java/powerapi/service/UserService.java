package powerapi.service;

import com.baomidou.mybatisplus.service.IService;
import powerapi.entity.User;

import java.util.Set;

/**
 * Created by Melon on 17/2/22.
 */
public interface UserService extends IService<User> {

    Set<String> findRoles(String username);

    Set<String> findPermissions(String username);

    User findByUsername(String username);
}
