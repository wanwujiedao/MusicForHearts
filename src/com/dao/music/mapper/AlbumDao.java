package com.dao.music.mapper;

import com.dao.music.base.dao.EntityDao;
import com.dao.music.daomain.vo.Album;
import org.springframework.stereotype.Repository;

/**
 * 专辑的Dao层
 * Created by dzx on 2016/3/15.
 */
@Repository
public interface AlbumDao extends EntityDao<Album> {
}
