package com.dao.music.base.utils;

import com.alibaba.fastjson.JSON;

/**
 * Created by dzx on 2016/1/28 0028.
 */
public class PageKeyToWeb {
    /**
     * 以下是主页头部直接跳转到到页面键值
     */
    //    跳转到主页的键值
    private  Integer home=PageUtils.HOME;

    //    跳转到全部mv界面键值
    private  Integer mvshowall=PageUtils.MV_SHOWALL;

    //    跳转到mv排行界面键值
    private  Integer mvranking=PageUtils.MV_RANKING;

    //    跳转到mv分类界面键值
    private  Integer mvgroups=PageUtils.MV_GROUPS;

    //跳转到所有歌曲界面键值
    private  Integer songshowall=PageUtils.SONG_SHOWAll;

    //跳转到歌曲排行榜键值
    private  Integer songranking=PageUtils.SONG_RANKING;

    //跳转到歌曲分类键值
    private  Integer songgroups=PageUtils.SONG_GROUPS;

    //跳转一展歌喉界面键值
    private  Integer personalsong=PageUtils.PERSONAL_SONG;

    //跳转到唯美画面键值
    private  Integer personalmv=PageUtils.PERSONAL_MV;

    //跳转到所有歌手界面键值
    private  Integer allartist=PageUtils.ALLARTIST;

    //跳转到建议与评价界面键值
    private  Integer advice=PageUtils.ADVICE;

    //跳转到举报界面键值
    private  Integer complain=PageUtils.COMPLAIN;

    //跳转到搜索界面键值
    private  Integer search=PageUtils.SEARCH;

    //跳转到通知公告到界面键值
    private  Integer notice=PageUtils.NOTICE;

    //跳转到注册界面键值
    private  Integer register=PageUtils.REGISTER;

    //跳转到个人中心界面键值
    private  Integer usercenter=PageUtils.USER_CENTER;

    //跳转到设置中心界面键值
    private   Integer usersetting=PageUtils.USER_SETTING;

    //跳转到用户管理
    public Integer manage_user_show=PageUtils.MANAGE_USER_SHOW;

    //跳转到音乐管理界面
    public  Integer manage_music_show=PageUtils.MANAGE_MUSIC_SHOW;

    //跳转到增加音乐信息界面
    public Integer manage_music_add=PageUtils.MANAGE_MUSIC_ADD;

    //跳转到音乐修改界面
    public Integer manage_music_edit=PageUtils.MANAGE_MUSIC_EDIT;

    //跳转到留言管理界面
    public Integer manage_advice_show=PageUtils.MANAGE_ADVICE_SHOW;

    //跳转到通知消息界面
    public Integer manage_noticy_show=PageUtils.MANAGE_NOTICY_SHOW;

    //跳转到通知消息发布界面
    public Integer manage_noticy_add=PageUtils.MANAGE_NOTICY_ADD;

    //跳转到通知消息修改界面
    public Integer manage_noticy_edit=PageUtils.MANAGE_NOTICY_EDIT;

    //跳转到举报界面
    public Integer manage_complain_show=PageUtils.MANAGE_COMPLAIN_SHOW;

    //跳转到超管界面
    public Integer manage_super_show=PageUtils.MANAGE_SUPER_SHOW;

    /**
     * 以下是非头部跳转页面
     */

    //跳转到mv播放界面键值
    private  Integer mvplayer=PageUtils.MV_PLAYER;

    //跳转到单首音乐播放界面键值
    private  Integer songplayer=PageUtils.SONG_PLAYER;

    //跳转到专辑界面键值
    private  Integer album=PageUtils.ALBUM;

    //跳转单个歌手界面键值
    private  Integer artist=PageUtils.ARTIST;

    public Integer getHome() {
        return home;
    }

    public Integer getMvshowall() {
        return mvshowall;
    }

    public Integer getMvranking() {
        return mvranking;
    }

    public Integer getMvgroups() {
        return mvgroups;
    }

    public Integer getSongshowall() {
        return songshowall;
    }

    public Integer getSongranking() {
        return songranking;
    }

    public Integer getSonggroups() {
        return songgroups;
    }

    public Integer getPersonalsong() {
        return personalsong;
    }

    public Integer getPersonalmv() {
        return personalmv;
    }

    public Integer getAllartist() {
        return allartist;
    }

    public Integer getAdvice() {
        return advice;
    }

    public Integer getComplain() {
        return complain;
    }

    public Integer getSearch() {
        return search;
    }

    public Integer getNotice() {
        return notice;
    }

    public Integer getRegister() {
        return register;
    }

    public Integer getUsercenter() {
        return usercenter;
    }

    public Integer getUsersetting() {
        return usersetting;
    }

    public Integer getMvplayer() {
        return mvplayer;
    }

    public Integer getSongplayer() {
        return songplayer;
    }

    public Integer getAlbum() {
        return album;
    }

    public Integer getArtist() {
        return artist;
    }

    public Integer getManage_user_show() {
        return manage_user_show;
    }

    public Integer getManage_music_show() {
        return manage_music_show;
    }

    public Integer getManage_music_add() {
        return manage_music_add;
    }

    public Integer getManage_music_edit() {
        return manage_music_edit;
    }

    public Integer getManage_advice_show() {
        return manage_advice_show;
    }

    public Integer getManage_noticy_show() {
        return manage_noticy_show;
    }

    public Integer getManage_noticy_add() {
        return manage_noticy_add;
    }

    public Integer getManage_noticy_edit() {
        return manage_noticy_edit;
    }

    public Integer getManage_complain_show() {
        return manage_complain_show;
    }

    public Integer getManage_super_show() {
        return manage_super_show;
    }

    @Override
    public String toString() {
        return JSON.toJSONString(this);
    }
}
