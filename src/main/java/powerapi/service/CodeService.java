package powerapi.service;

import com.baomidou.mybatisplus.service.IService;
import powerapi.entity.Code;

import java.util.List;

/**
 * Created by Melon on 17/2/22.
 */
public interface CodeService extends IService<Code> {

    List<Code> selectByProjectId(Long proId);
}
