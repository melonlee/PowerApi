package powerapi.mapper;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;
import powerapi.entity.User;

import java.util.ArrayList;

/**
 * Created by Melon on 17/2/22.
 */
public interface UserMapper extends BaseMapper<User> {

    User findByName(@Param(value = "username") String username);

    ArrayList<String> findRoles(@Param(value = "username") String username);

    ArrayList<String> findPermissions(@Param(value = "username") String username);

}