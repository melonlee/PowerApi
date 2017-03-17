package powerapi.web.controller;

import org.apache.shiro.SecurityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import powerapi.entity.BaseEntity;
import powerapi.entity.Project;
import powerapi.entity.User;
import powerapi.service.ProjectService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by Melon on 17/3/14.
 */
public abstract class BaseController {

    protected HttpServletRequest request;
    protected HttpServletResponse response;
    protected Logger log = LoggerFactory.getLogger(this.getClass());

    @Autowired
    protected ProjectService projectService;

    /**
     * 从shiro的session中获取当前登录用户
     *
     * @return
     */
    protected User getCurrentUser() {
        return (User) SecurityUtils.getSubject().getSession().getAttribute("curUser");
    }

    /**
     * 从缓存中获取项目信息
     *
     * @param id
     * @return
     */
    protected Project getProject(Long id) {

        return projectService.findProjectById(id);
    }

}
