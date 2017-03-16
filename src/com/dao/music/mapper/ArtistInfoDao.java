package com.dao.music.mapper;

import com.dao.music.base.dao.EntityDao;
import com.dao.music.base.daomain.Page;
import com.dao.music.daomain.dto.ArtistInfo;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by admin on 2016/3/9.
 */
@Repository
public interface ArtistInfoDao extends EntityDao<ArtistInfo>{
   List<ArtistInfo> findBySearch(Page<ArtistInfo> page);

   ArtistInfo findByRonum(Long rounum);

}
