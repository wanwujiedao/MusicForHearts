package com.dao.music.daomain.service;

import com.dao.music.base.daomain.Page;
import com.dao.music.daomain.dto.ArtistInfo;

import java.util.List;

/**
 * 歌手的服务层
 * Created by dzx on 2016/3/10.
 */
public interface IArtistService {
     Page<ArtistInfo> findArtist(Page<ArtistInfo> page);
     ArtistInfo findArtistById(ArtistInfo artistInfo);
     Page<ArtistInfo> findBySearch(Page<ArtistInfo> page);
     Page<ArtistInfo>  findRadom(Page<ArtistInfo> page,Integer num);
}
