package powerapi.web.exception;

import org.apache.shiro.authz.UnauthorizedException;
import org.springframework.web.bind.MissingServletRequestParameterException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.servlet.ModelAndView;

/**
 * 设置权限异常时的处理
 * Created by Melon on 17/2/26.
 */

@ControllerAdvice
public class UnauthorizedExceptionHandler {

    @ExceptionHandler({UnauthorizedException.class})
    public ModelAndView processUnauthenticatedException(NativeWebRequest request, UnauthorizedException e) {
        ModelAndView mv = new ModelAndView();
        mv.addObject("exception", e.getMessage());
        mv.setViewName("/common/error");
        return mv;
    }

    @ExceptionHandler({MissingServletRequestParameterException.class})
    public ModelAndView processMissingServletRequestParameterException(NativeWebRequest request, MissingServletRequestParameterException e) {
        ModelAndView mv = new ModelAndView();
        mv.addObject("exception", e.getMessage());
        mv.setViewName("/common/error");
        return mv;
    }

}
