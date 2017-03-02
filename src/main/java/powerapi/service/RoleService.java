package powerapi.service;

import powerapi.entity.Role;

import java.util.List;

/**
 * Created by Melon on 17/2/22.
 */
public interface RoleService {

    /**
     * 新增角色信息
     *
     * @param role
     * @return
     */
    public Role createRole(Role role);

    /**
     * 根据id删除角色
     *
     * @param roleId
     */
    public void deleteRole(Long roleId);

    /**
     * 设置角色-权限之间关系
     *
     * @param roleId
     * @param permissionIds
     */
    public void correlationPermissions(Long roleId, Long... permissionIds);

    /**
     * 解除角色-权限之间关系
     *
     * @param roleId
     * @param permissionIds
     */
    public void uncorrelationPermissions(Long roleId, Long... permissionIds);

    /**
     * 列出所有角色信息
     *
     * @return
     */
    List<Role> findAll();

    /**
     * 根据角色信息删除该角色下对应的权限
     *
     * @param roleId
     */
    void deletePermissionByRole(Long roleId);

    /**
     * 根据id获取某角色信息
     *
     * @param id
     * @return
     */
    Role findOne(Long id);

    /**
     * 根据用户id获取该用户拥有的角色
     *
     * @param adminId
     * @return
     */
    List<Role> findByAdmin(Long adminId);

    /**
     * 更新橘色信息
     *
     * @param role
     * @return
     */
    Role updateRole(Role role);
}
