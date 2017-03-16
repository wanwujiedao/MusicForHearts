package com.dao.music.mapper;

import com.dao.music.base.dao.EntityDao;
import com.dao.music.base.daomain.Page;
import com.dao.music.daomain.vo.Advice;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by dzx on 2016/3/28.
 */
@Repository
public interface AdviceDao extends EntityDao<Advice> {
    List<Advice> findByUserId(Page<Advice> page);
    Long getTotalByUser(Page<Advice> page);
}
