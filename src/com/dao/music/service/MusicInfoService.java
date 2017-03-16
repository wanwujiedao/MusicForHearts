package com.dao.music.service;

import com.dao.music.base.daomain.Page;
import com.dao.music.base.utils.DateUtils;
import com.dao.music.base.utils.KeyCode;
import com.dao.music.daomain.dto.MusicInfo;
import com.dao.music.daomain.dto.MusicRanking;
import com.dao.music.daomain.service.IMusicInfoService;
import com.dao.music.daomain.vo.Music;
import com.dao.music.mapper.MusicInfoDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

/**
 * 音乐详细信息服务层的实现
 * Created by dzx on 2016/2/8 0008.
 */
@Service
public class MusicInfoService implements IMusicInfoService {
    @Autowired
    private MusicInfoDao musicInfoDao;

    //查询的音乐信息
    public Page<MusicInfo> findMusicInfo(Page<MusicInfo> page) {
        List<MusicInfo> musicInfos = musicInfoDao.find(page);
        Long total = musicInfoDao.getTotal(page);
        return communal(page, musicInfos, total);
    }


    //音乐综合排行
    public Page<MusicRanking> findMusicInfoByRanking(Page<MusicRanking> page) {
        List<MusicRanking> musicInfos = musicInfoDao.findMusicByRanking(page);
        page.setRows(musicInfos);
        Page<MusicInfo> page1 = new Page<MusicInfo>(page.getPagesize(), page.getPagenum(), page.getType());
        Long total = musicInfoDao.getTotal(page1);
        page.setTotal(total);
        return page;
    }

    //根据id查询指定的音乐信息
    public MusicInfo findMusicById(MusicInfo musicInfo) {
        return musicInfoDao.findById(musicInfo);
    }


    //音乐搜索
    public Page<MusicInfo> findMusicBySearch(Page<MusicInfo> page) {

        List<MusicInfo> musicInfos = musicInfoDao.findMusicBySearch(page);
        Long total = musicInfoDao.searchTotal(page);

        return communal(page, musicInfos, total);
    }

    //用户收藏的音乐
    public Page<MusicInfo> findMusicByUser(Page<MusicInfo> page) {
        List<MusicInfo> musicInfos = musicInfoDao.findMusicByUser(page);
        Long total = musicInfoDao.getUserMusicTotal(page);
        return communal(page, musicInfos, total);
    }

    public Page<MusicInfo> communal(Page<MusicInfo> page, List<MusicInfo> musicInfos, Long total) {
        page.setRows(musicInfos);
        page.setTotal(total);
        return page;
    }

    public void update(Music music) {
        musicInfoDao.updateMusic(music);
    }


    public Page<MusicInfo> findMusicInfoByRadom(Page<MusicInfo> page, Integer num) {
        List<MusicInfo> musicInfos = new ArrayList<MusicInfo>();
        Long total = musicInfoDao.getTotal(page);
        List<Long> isexit = new ArrayList<Long>();
        Random rd = new Random();
        for (int count = 0; count < num; count++) {
            Long rdnum = Long.valueOf(rd.nextInt(Integer.valueOf(total.toString())));
            MusicInfo musicInfo = new MusicInfo();
            musicInfo.setType(page.getType());
            if (isexit.contains(rdnum) || rdnum == 0) {
                count--;
                continue;
            }
            isexit.add(rdnum);
            musicInfo.setNum(rdnum);
            musicInfos.add(musicInfoDao.findByRonum(musicInfo));
        }
        page.setRows(musicInfos);


        return page;
    }

    public void deleteMusicById(MusicInfo music) {
        musicInfoDao.deleteById(music);
    }

    public void insertMusic(MusicInfo musicInfo) {
        musicInfo.setReleasetime(DateUtils.doFormatDate(new Date(), "yyyy-MM-dd"));
        musicInfo.setPlaycount(KeyCode.START_COUNT);
        musicInfo.setCollectcount(KeyCode.START_COUNT);
        musicInfo.setDownloadcount(KeyCode.START_COUNT);
        musicInfoDao.insert(musicInfo);

    }
   public MusicInfo findMusicByPath(MusicInfo musicInfo)   {
      return musicInfoDao.findMusicByPath(musicInfo);
   }
    public void saveType(MusicInfo musicInfo){
        musicInfoDao.saveType(musicInfo);
    }
}
