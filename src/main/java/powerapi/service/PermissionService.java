package powerapi.service;


import powerapi.entity.Permission;

import java.util.List;

/**
 * Created by Melon on 17/2/22.
 */
public interface PermissionService {

    /**
     * 新增权限
     *
     * @param permission
     * @return
     */
    public Permission createPermission(Permission permission);

    /**
     * 根据id删除权限
     *
     * @param permissionId
     */
    public void deletePermission(Long permissionId);

    /**
     * 列出所有权限信息
     *
     * @return
     */
    List<Permission> findAll();

    /**
     * 根据角色获取该角色下拥有的权限信息
     *
     * @param id
     * @return
     */
    List<Permission> findByRole(Long id);

    /**
     * 更新权限信息
     *
     * @param p
     */
    void updatePermission(Permission p);
}
