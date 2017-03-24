package powerapi.plugin.aop;

import org.apache.shiro.SecurityUtils;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.support.MethodOverride;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Component;
import powerapi.common.Constants;
import powerapi.common.anno.LogDelete;
import powerapi.entity.*;
import powerapi.service.FunctionService;
import powerapi.service.ModuleService;
import powerapi.service.ProjectService;

import java.lang.reflect.Method;

/**
 * Created by Melon on 2017/3/24.
 */

@Aspect
@Component
public class SignupAdvice {
    @Autowired
    private ProjectService projectService;

    @Autowired
    private ModuleService moduleService;

    @Autowired
    private FunctionService functionService;

    @Pointcut("execution(* powerapi.web.controller.AuthController.signup(..))")
    public void signupAspect() {

    }

    /**
     * 为用户创建一个默认的示例项目以供参考
     *
     * @param joinPoint
     * @throws InterruptedException
     */
    @AfterReturning("signupAspect()")
    @Async
    public void afterReturn(JoinPoint joinPoint) throws InterruptedException {
        BaseEntity entity = (BaseEntity) joinPoint.getArgs()[0];
        if (null != entity.getId()) {
            // create project
            Project project = new Project();
            project.setTitle("示例项目");
            project.setDescription("这是系统默认生成的示例项目");
            project.setPattern("");
            project.setHostUrl("http://api.host.com");
            project.setVersion("1.0.0");
            project.setUserId(entity.getId());
            projectService.insert(project);
            // create module
            if (null != project.getId()) {

                Module module = new Module();
                module.setUserId(entity.getId());
                module.setDescription("这是系统默认生成的示例模块");
                module.setTitle("用户模块");
                module.setpId(project.getId());
                module.setUrl("/user");
                moduleService.insert(module);
                // create interface
                if (null != module.getId()) {

                    Function function = new Function();
                    function.setUrl("/login");
                    function.setTitle("用户登录");
                    function.setDescription("用户输入用户名及密码进行登录");
                    function.setMethod("POST");
                    function.setmId(module.getId());
                    function.setParams("{\"params\":[{\"name\":\"phone\",\"type\":\"String\",\"desc\":\"手机号\",\"isneed\":\"1\",\"value\":\"18612481035\",\"defaultvalue\":\"\"},{\"name\":\"passwd\",\"type\":\"String\",\"desc\":\"密码MD5加密\",\"isneed\":\"1\",\"value\":\"WEJOSJDFKJSH\",\"defaultvalue\":\"\"},{\"name\":\"nickname\",\"type\":\"String\",\"desc\":\"用户名\",\"isneed\":\"1\",\"value\":\"大头\",\"defaultvalue\":\"\"},{\"name\":\"platform\",\"type\":\"Int\",\"desc\":\"1-ios 2-android\",\"isneed\":\"1\",\"value\":\"1\",\"defaultvalue\":\"\"},{\"name\":\"platformToken\",\"type\":\"String\",\"desc\":\"推送token号\",\"isneed\":\"1\",\"value\":\"\",\"defaultvalue\":\"\"}]}");
                    function.setResponseBody("{\"code\":1000,\"result\":{\"id\":1,\"nickname\":\"ko\",\"passwd\":\"WEJOSJDFKJSHD23342N23\",\"phone\":\"18612481035\"}}");
                    function.setResponseType("JSON");
                    functionService.insert(function);
                }
            }
        }
    }
}
