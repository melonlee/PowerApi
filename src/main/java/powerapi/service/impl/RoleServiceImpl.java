package powerapi.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import powerapi.entity.Role;
import powerapi.mapper.RoleMapper;
import powerapi.service.RoleService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Melon on 17/2/22.
 */
@Service
public class RoleServiceImpl implements RoleService {

    @Resource
    private RoleMapper roleMapper;

    public Role createRole(Role role) {

        roleMapper.insert(role);

        return role;
    }

    public void deleteRole(Long roleId) {

        roleMapper.deleteById(roleId);
    }

    public void correlationPermissions(Long roleId, Long... permissionIds) {

        if (null == permissionIds || permissionIds.length == 0) {
            return;
        }

        for (Long permissionId : permissionIds) {
            roleMapper.insertPermissions(roleId, permissionId);
        }

    }

    public void uncorrelationPermissions(Long roleId, Long... permissionIds) {
        if (null == permissionIds || permissionIds.length == 0) {
            return;
        }
        for (Long permissionId : permissionIds) {
            roleMapper.deletePermissions(roleId, permissionId);
        }
    }

    public List<Role> findAll() {
        return roleMapper.selectList(new EntityWrapper<Role>());
    }

    public void deletePermissionByRole(Long id) {
        roleMapper.deletePermissionByRole(id);
    }

    public Role findOne(Long id) {
        return roleMapper.selectById(id);
    }

    public List<Role> findByAdmin(Long adminId) {
        return roleMapper.findByAdmin(adminId);
    }

    public Role updateRole(Role role) {
        roleMapper.updateById(role);
        return role;
    }
}
