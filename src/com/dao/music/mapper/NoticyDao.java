package com.dao.music.mapper;

import com.dao.music.base.dao.EntityDao;
import com.dao.music.base.daomain.Page;
import com.dao.music.daomain.dto.Noticy;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by dzx on 2016/3/29.
 */
@Repository
public interface NoticyDao extends EntityDao<Noticy> {
    List<Noticy> findDelete(Page<Noticy> page);
    Long getTotalDelete(Page<Noticy> page);
}
