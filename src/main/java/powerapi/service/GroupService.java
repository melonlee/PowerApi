package powerapi.service;

import com.baomidou.mybatisplus.service.IService;
import powerapi.entity.Group;

import java.util.List;

/**
 * Created by Melon on 2017/8/14.
 */
public interface GroupService extends IService<Group> {

    List<Group> selectByUserId(Long userId);
}
