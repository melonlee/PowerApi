package powerapi.service.impl;


import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import powerapi.entity.Function;
import powerapi.entity.Module;
import powerapi.mapper.FunctionMapper;
import powerapi.service.FunctionService;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Melon on 17/2/22.
 */
@Service
public class FunctionServiceImpl extends ServiceImpl<FunctionMapper, Function> implements FunctionService {

    @Autowired
    private FunctionMapper functionMapper;

    public List<Function> selectByModuleId(Long mId) {
        return this.selectList(new EntityWrapper<Function>().eq("m_id", mId));
    }

    @Override
    public List<Function> selectByProjectId(Long pId) {

        return functionMapper.selectByProjectId(pId);
    }
}
