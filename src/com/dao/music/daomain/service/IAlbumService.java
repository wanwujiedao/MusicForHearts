package com.dao.music.daomain.service;

import com.dao.music.base.daomain.Page;
import com.dao.music.daomain.vo.Album;

/**
 * 专辑服务层接口
 * Created by dzx on 2016/3/15.
 */
public interface IAlbumService {
    Album findAlbumById(Album album);
    Page<Album> findAlbum(Page<Album> page);
}
