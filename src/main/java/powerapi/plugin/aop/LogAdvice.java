package powerapi.plugin.aop;

import com.alibaba.druid.support.json.JSONUtils;
import org.apache.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import powerapi.common.anno.LogAnno;
import powerapi.entity.BaseEntity;
import powerapi.entity.Log;
import powerapi.entity.Project;
import powerapi.entity.User;
import powerapi.service.LogService;

import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by Melon on 17/3/18.
 */
@Aspect
@Component
public class LogAdvice {

    public static final Logger logger = Logger.getLogger(LogAdvice.class);


    @Autowired
    private LogService logService;

    @Pointcut("@annotation(powerapi.common.anno.LogAnno)")
    public void logAnnoAspect() {

    }


    /**
     * @param joinPoint
     */
    @AfterReturning("logAnnoAspect()")

    public void afterReturn(JoinPoint joinPoint) {
        MethodSignature methodSignature = (MethodSignature) joinPoint.getSignature();
        Method method = methodSignature.getMethod();
        LogAnno log = method.getAnnotation(LogAnno.class);
        if (null != log) {

            Object curobj = joinPoint.getArgs()[0];

            if (curobj instanceof Project) {
                logService.insert(new Log(log.action(),
                        ((Project) curobj).getTitle(),
                        ((BaseEntity) joinPoint.getArgs()[0]).getId(),
                        ((User) SecurityUtils.getSubject().getSession().getAttribute("curUser")).getId()));
            }

//            logger.info(String.format("业务日志 : [%s]", log.action()));
//            Map<String, Object> map = new HashMap<String, Object>();
//            map.put("className", joinPoint.getTarget().getClass().getName());
//            map.put("methodName", method.getName());
//
//            if (method.getName().equals("delete")) {
//                logger.info(joinPoint.getArgs()[0]);
//            } else {
//                logger.info(joinPoint.getArgs()[0].toString());
//            }
//            map.put("args", JSONUtils.toJSONString(joinPoint.getArgs().toString()));
//            logger.info(JSONUtils.toJSONString(map));
        }
    }
}
