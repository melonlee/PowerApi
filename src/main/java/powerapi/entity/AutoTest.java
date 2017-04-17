package powerapi.entity;

/**
 * 自动化测试类
 * <p/>
 * Created by Melon on 2017/4/17.
 */
public class AutoTest extends BaseEntity {

    private Long userId;
    private String title;
    private int process;
    private int status;

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getProcess() {
        return process;
    }

    public void setProcess(int process) {
        this.process = process;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
