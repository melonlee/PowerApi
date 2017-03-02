package powerapi.mapper;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import powerapi.entity.Permission;
import org.apache.ibatis.annotations.Param;

import java.util.List;


/**
 * Created by Melon on 17/2/22.
 */
public interface PermissionMapper extends BaseMapper<Permission> {
    List<Permission> findByRole(@Param(value = "roleId") Long roleId);
}
