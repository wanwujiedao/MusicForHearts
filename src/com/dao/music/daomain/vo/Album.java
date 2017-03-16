package com.dao.music.daomain.vo;

import com.alibaba.fastjson.JSON;
import com.dao.music.base.dao.Entity;

/**
 * 专辑的Bean
 * Created by dzx on 2016/3/15.
 */
public class Album extends Entity{
    private Long albumid;
    private String albumname;
    private String albumartist;
    private String albumaddtime;
    private String albumposter;
    private String albuminfo;

    public String getAlbuminfo() {
        return albuminfo;
    }

    public void setAlbuminfo(String albuminfo) {
        this.albuminfo = albuminfo;
    }

    public Long getAlbumid() {
        return albumid;
    }

    public void setAlbumid(Long albumid) {
        this.albumid = albumid;
    }

    public String getAlbumname() {
        return albumname;
    }

    public void setAlbumname(String albumname) {
        this.albumname = albumname;
    }

    public String getAlbumartist() {
        return albumartist;
    }

    public void setAlbumartist(String albumartist) {
        this.albumartist = albumartist;
    }

    public String getAlbumaddtime() {
        return albumaddtime;
    }

    public void setAlbumaddtime(String albumaddtime) {
        this.albumaddtime = albumaddtime;
    }

    public String getAlbumposter() {
        return albumposter;
    }

    public void setAlbumposter(String albumposter) {
        this.albumposter = albumposter;
    }

    @Override
    public String toString() {
        return JSON.toJSONString(this);
    }
}
