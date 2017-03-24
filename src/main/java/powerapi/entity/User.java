package powerapi.entity;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;

import java.util.List;

/**
 * Created by Melon on 17/3/2.
 */
@TableName("t_user")
public class User extends BaseEntity {

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;

    private String username;

    private String passwd;

    private String salt;

    private String email;

    @TableField(exist = false)
    private List<Long> roles;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPasswd() {
        return passwd;
    }

    public void setPasswd(String passwd) {
        this.passwd = passwd;
    }

    public String getSalt() {
        return salt;
    }

    public void setSalt(String salt) {
        this.salt = salt;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public List<Long> getRoles() {
        return roles;
    }

    public void setRoles(List<Long> roles) {
        this.roles = roles;
    }

    public String getCredentialsSalt() {
        return username + salt;
    }

    @Override
    public String toString() {
        return "User{" +
                "id='" + id + '\'' +
                "username='" + username + '\'' +
                ", passwd='" + passwd + '\'' +
                ", salt='" + salt + '\'' +
                ", email='" + email + '\'' +
                ", roles=" + roles +
                '}';
    }
}
