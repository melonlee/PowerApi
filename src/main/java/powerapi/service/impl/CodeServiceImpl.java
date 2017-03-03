package powerapi.service.impl;


import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import powerapi.entity.Code;
import powerapi.mapper.CodeMapper;
import powerapi.service.CodeService;

/**
 * Created by Melon on 17/2/22.
 */
@Service
public class CodeServiceImpl extends ServiceImpl<CodeMapper,Code> implements CodeService {


}
