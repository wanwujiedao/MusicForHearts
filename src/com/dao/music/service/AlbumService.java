package com.dao.music.service;

import com.dao.music.base.daomain.Page;
import com.dao.music.daomain.service.IAlbumService;
import com.dao.music.daomain.vo.Album;
import com.dao.music.mapper.AlbumDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by admin on 2016/3/15.
 */
@Service
public class AlbumService implements IAlbumService{

    @Autowired
    private AlbumDao albumDao;

    @Override
    public Album findAlbumById(Album album) {
        return albumDao.findById(album);
    }

    @Override
    public Page<Album> findAlbum(Page<Album> page) {
        List<Album> albums=albumDao.find(page);
        page.setRows(albums);
        Long total=albumDao.getTotal(page);
        page.setTotal(total);
        return page;
    }
}
