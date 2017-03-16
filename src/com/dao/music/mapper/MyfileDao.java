package com.dao.music.mapper;

import com.dao.music.base.dao.EntityDao;
import com.dao.music.daomain.vo.Myfile;
import org.springframework.stereotype.Repository;

/**
 * Created by dzx on 2016/3/21.
 */
@Repository
public interface MyfileDao extends EntityDao<Myfile>{

 Long getMyfileIDByPath(String path);
}
