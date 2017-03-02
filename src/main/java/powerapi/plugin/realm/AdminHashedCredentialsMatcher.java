package powerapi.plugin.realm;

import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.credential.HashedCredentialsMatcher;


/**
 * Created by Melon on 17/2/28.
 */
public class AdminHashedCredentialsMatcher extends HashedCredentialsMatcher {

    /**
     * 可以在方法中对用户登录进行一些验证
     * <p/>
     * 1.登录次数
     * 2.登录ip限制
     * 3.登录请求限制
     * ...etc
     *
     * @param token
     * @param info
     * @return
     */
    @Override
    public boolean doCredentialsMatch(AuthenticationToken token, AuthenticationInfo info) {

        return super.doCredentialsMatch(token, info);
    }
}
