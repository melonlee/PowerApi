package powerapi.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import powerapi.entity.Permission;
import powerapi.mapper.PermissionMapper;
import powerapi.service.PermissionService;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Melon on 17/2/22.
 */
@Service
public class PermissionServiceImpl implements PermissionService {

    @Resource
    private PermissionMapper permissionMapper;

    public Permission createPermission(Permission permission) {
        permissionMapper.insert(permission);
        return permission;
    }

    public void deletePermission(Long permissionId) {
        permissionMapper.deleteById(permissionId);
    }

    public List<Permission> findAll() {
        return permissionMapper.selectList(new EntityWrapper<Permission>());
    }

    public List<Permission> findByRole(@Param(value = "roleId") Long roleId) {
        return permissionMapper.findByRole(roleId);
    }

    public void updatePermission(Permission p) {
        permissionMapper.updateById(p);
    }
}
