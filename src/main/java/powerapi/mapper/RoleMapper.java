package powerapi.mapper;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import powerapi.entity.Role;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by Melon on 17/2/22.
 */
public interface RoleMapper extends BaseMapper<Role> {

    void deletePermissions(@Param(value = "roleId") Long roleId, @Param(value = "permissionId") Long permissionId);

    void insertPermissions(@Param(value = "roleId") Long roleId, @Param(value = "permissionId") Long permissionId);

    void deletePermissionByRole(@Param(value = "roleId") Long roleId);

    List<Role> findByAdmin(@Param(value = "adminId") Long adminId);
}
