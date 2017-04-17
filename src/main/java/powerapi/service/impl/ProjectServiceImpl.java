package powerapi.service.impl;


import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import powerapi.entity.Project;
import powerapi.mapper.ProjectMapper;
import powerapi.plugin.redis.RedisCache;
import powerapi.service.ProjectService;

import java.util.List;

/**
 * Created by Melon on 17/2/22.
 */
@Service
public class ProjectServiceImpl extends ServiceImpl<ProjectMapper, Project> implements ProjectService {


    @Autowired
    private RedisCache redisCache;

    public List<Project> getProjectList(Long userId) {

//        String cache_key = redisCache.CAHCENAME + "|" + userId + "|projects|" + page;
//        List<Project> result_cache = redisCache.getListCache(cache_key, Project.class);
//        if (result_cache == null) {
//            result_cache = this.selectPage(new Page<Project>(page, 10),
//                    new EntityWrapper<Project>().eq("user_id", userId).orderBy("createdate", false)).getRecords();
//            if (result_cache.size() > 0) {
//                redisCache.putListCacheWithExpireTime(cache_key, result_cache, RedisCache.CAHCETIME);
//            }
//            return result_cache;
//        }
        return this.selectList(new EntityWrapper<Project>().eq("user_id", userId).orderBy("createdate", false));
    }

    @Override
    public Project findProjectById(Long id) {

        String cache_key = redisCache.CAHCENAME + "|project|" + id;
        Project project = redisCache.getCache(cache_key, Project.class);
        if (project == null) {
            project = this.selectById(id);
            redisCache.putCache(cache_key, project);
        }
        return project;
    }

    @Override
    public void deleteProject(Long id) {
        String cache_key = redisCache.CAHCENAME + "|project|" + id;
        Project project = redisCache.getCache(cache_key, Project.class);
        if (project != null) {
            redisCache.deleteCache(cache_key);
            this.deleteById(id);
        }
    }

    @Override
    public void modifyProject(Project project) {

        boolean status = this.insertOrUpdate(project);
        if (status) {
            redisCache.putCache(redisCache.CAHCENAME + "|project|" + project.getId(), project);
        }
    }
}
