package powerapi.common.utils;

/**
 * 
 * 
 * 用来标记业务返回状态码
 * 
 * @author Melon
 * 
 */
public class CodeUtils {

	public static final Integer CODE_SUCCESS = 1000;

	public static final Integer CODE_FAIL = 1001;

	public static final String CODE_FAIL_MSG = "操作失败，请稍后重试!";

	public static final Integer CODE_FINAL_PAGE = 1002;

	public static final String CODE_FINAL_PAGE_MSG = "已经是最后一页!";

	public static final Integer CODE_WRONG_PARAM = 1003;

	public static final String CODE_WRONG_PARAM_MSG = "参数有误";

}
