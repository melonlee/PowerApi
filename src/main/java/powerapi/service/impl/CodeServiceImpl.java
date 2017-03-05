package powerapi.service.impl;


import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import powerapi.entity.Bug;
import powerapi.entity.Code;
import powerapi.mapper.CodeMapper;
import powerapi.service.CodeService;

import java.util.List;

/**
 * Created by Melon on 17/2/22.
 */
@Service
public class CodeServiceImpl extends ServiceImpl<CodeMapper, Code> implements CodeService {


    public List<Code> selectByProjectId(Long proId) {
        return this.selectList(new EntityWrapper<Code>().eq("p_id", proId));

    }
}
