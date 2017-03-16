package com.dao.music.daomain.service;

import com.dao.music.base.daomain.Page;
import com.dao.music.daomain.dto.MusicInfo;
import com.dao.music.daomain.dto.MusicRanking;
import com.dao.music.daomain.vo.Music;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 音乐详细信息服务层接口
 * Created by dzx on 2016/2/8 0008.
 */

public interface IMusicInfoService {
    //查询音乐
    Page<MusicInfo> findMusicInfo(Page<MusicInfo> page);
    Page<MusicInfo> findMusicInfoByRadom(Page<MusicInfo> page,Integer num);

    //音乐排行
    Page<MusicRanking> findMusicInfoByRanking(Page<MusicRanking> page);

    MusicInfo findMusicById(MusicInfo musicInfo);

    //音乐搜索
     Page<MusicInfo> findMusicBySearch(Page<MusicInfo> page);

    //用户收藏的音乐
    Page<MusicInfo> findMusicByUser(Page<MusicInfo> page);

    //更新
    void update(Music music);
    //删除music
    void deleteMusicById(MusicInfo music);
    //插入音乐
    void insertMusic(MusicInfo musicInfo);
    //通过路径查询音乐信息
    MusicInfo findMusicByPath(MusicInfo musicInfo);

    //存储音乐类型
    void saveType(MusicInfo musicInfo);
}
