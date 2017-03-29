package powerapi.dto;

/**
 * Created by Melon on 2017/3/29.
 */
public class DashboardDto {

    private int projectCount = 1;

    private int interfaceCount = 1;

    private int bugCount;

    private int codeCount;

    public int getProjectCount() {
        return projectCount;
    }

    public void setProjectCount(int projectCount) {
        this.projectCount = projectCount;
    }

    public int getInterfaceCount() {
        return interfaceCount;
    }

    public void setInterfaceCount(int interfaceCount) {
        this.interfaceCount = interfaceCount;
    }

    public int getBugCount() {
        return bugCount;
    }

    public void setBugCount(int bugCount) {
        this.bugCount = bugCount;
    }

    public int getCodeCount() {
        return codeCount;
    }

    public void setCodeCount(int codeCount) {
        this.codeCount = codeCount;
    }
}
