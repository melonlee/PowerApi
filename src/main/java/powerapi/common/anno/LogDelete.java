package powerapi.common.anno;

import java.lang.annotation.*;

/**
 * Created by Melon on 17/3/18.
 */
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface LogDelete {

    String value() default "";

    String resource() default "";
}
