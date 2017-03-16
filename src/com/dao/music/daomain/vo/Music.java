package com.dao.music.daomain.vo;

import com.alibaba.fastjson.JSON;
import com.dao.music.base.dao.Entity;

/**
 * Created by admin on 2016/4/12.
 */
public class Music extends Entity
{
    private Long id;
    private String name;
    private String releasetime;
    private String info;
    private Integer playcount;
    private Integer collectcount;
    private Integer downloadcount;
    private Long musicid;
    private Long albumid;
    private Long artistid;
    private String time;
    private Long poster;
    private Integer type;

    public Long getId() {

        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getReleasetime() {
        return releasetime;
    }

    public void setReleasetime(String releasetime) {
        this.releasetime = releasetime;
    }

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    public Integer getPlaycount() {
        return playcount;
    }

    public void setPlaycount(Integer playcount) {
        this.playcount = playcount;
    }

    public Integer getCollectcount() {
        return collectcount;
    }

    public void setCollectcount(Integer collectcount) {
        this.collectcount = collectcount;
    }

    public Integer getDownloadcount() {
        return downloadcount;
    }

    public void setDownloadcount(Integer downloadcount) {
        this.downloadcount = downloadcount;
    }

    public Long getMusicid() {
        return musicid;
    }

    public void setMusicid(Long musicid) {
        this.musicid = musicid;
    }

    public Long getAlbumid() {
        return albumid;
    }

    public void setAlbumid(Long albumid) {
        this.albumid = albumid;
    }

    public Long getArtistid() {
        return artistid;
    }

    public void setArtistid(Long artistid) {
        this.artistid = artistid;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public Long getPoster() {
        return poster;
    }

    public void setPoster(Long poster) {
        this.poster = poster;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    @Override
    public String toString() {
        return JSON.toJSONString(this);
    }
}
