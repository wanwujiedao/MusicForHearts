package com.dao.music.mapper;

import com.dao.music.base.dao.EntityDao;
import com.dao.music.base.daomain.Page;
import com.dao.music.daomain.dto.MusicInfo;
import com.dao.music.daomain.dto.MusicRanking;
import com.dao.music.daomain.vo.Music;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by dzx on 2016/2/8 0008.
 */
@Repository
public interface MusicInfoDao  extends EntityDao<MusicInfo>{
    List<MusicRanking> findMusicByRanking(Page<MusicRanking> page);

//    public List<MusicInfo> findMusicByGroups(Page<MusicInfo> page);

     List<MusicInfo> findMusicBySearch(Page<MusicInfo> page);
     List<MusicInfo> findMusicByUser(Page<MusicInfo> page);
    Long searchTotal(Page<MusicInfo> page);
    Long getUserMusicTotal(Page<MusicInfo> page);
    void updateMusic(Music music);
    MusicInfo findByRonum(MusicInfo musicInfo);
    MusicInfo findMusicByPath(MusicInfo musicInfo);
    void saveType(MusicInfo musicInfo);
}
