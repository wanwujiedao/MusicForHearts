package com.dao.music.service;

import com.dao.music.base.daomain.Page;
import com.dao.music.daomain.dto.ArtistInfo;
import com.dao.music.daomain.service.IArtistService;
import com.dao.music.mapper.ArtistInfoDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

/**
 * 歌手服务层的实现
 * Created by dzx on 2016/3/10.
 */
@Service
public class ArtistService implements IArtistService {

    @Autowired
    private ArtistInfoDao artistInfoDao;

    public Page<ArtistInfo> findArtist(Page<ArtistInfo> page){
        List<ArtistInfo> artistInfos=artistInfoDao.find(page);
        page.setRows(artistInfos);
        Long total=artistInfoDao.getTotal(page);
        page.setTotal(total);
        return page;
    };
    public ArtistInfo findArtistById(ArtistInfo artistInfo){
        return artistInfoDao.findById(artistInfo);
    };

    public Page<ArtistInfo> findBySearch(Page<ArtistInfo> page){
        List<ArtistInfo> artistInfos=artistInfoDao.findBySearch(page);
        page.setRows(artistInfos);
        Long total=artistInfoDao.SearchTotal(page);
        page.setTotal(total);
        return page;
    }
    public  Page<ArtistInfo> findRadom(Page<ArtistInfo> page,Integer num){
        List<ArtistInfo> musicInfos = new ArrayList<ArtistInfo>();
        Long total = artistInfoDao.getTotal(page);
        List<Long> isexit = new ArrayList<Long>();
        Random rd = new Random();
        for (int count = 0; count < num; count++) {
            Long rdnum = Long.valueOf(rd.nextInt(Integer.valueOf(total.toString())));
            if (isexit.contains(rdnum)||rdnum==0) {
                count--;
                continue;
            }
            isexit.add(rdnum);
            musicInfos.add(artistInfoDao.findByRonum(rdnum));
        }
        page.setRows(musicInfos);



        return page;
    }
}
