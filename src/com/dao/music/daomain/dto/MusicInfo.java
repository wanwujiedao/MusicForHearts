package com.dao.music.daomain.dto;

import com.alibaba.fastjson.JSON;
import com.dao.music.base.dao.Entity;
import com.dao.music.base.utils.GetLrc;

/**
 * Created by dzx on 2016/2/8 0008.
 */
public class MusicInfo extends Entity {
    private Long musicid;
    private Integer playcount;
    private Integer collectcount;
    private Integer downloadcount;
    private Integer type;
    private String name;
    private String releasetime;
    private String info;
    private String time;
    private String url;
    private String albumname;
    private String artistname;
    private Long id;
    private Long albumid;
    private Long artistid;
    private String path;
    private Long poster;
    private String posterurl;
    private Long num;
    private String lrcurl;
    private Long typeid;


    public Long getTypeid() {
        return typeid;
    }

    public void setTypeid(Long typeid) {
        this.typeid = typeid;
    }

    public String getLrcurl() {
        return lrcurl;
    }

    public void setLrcurl(String lrcurl) {
        this.lrcurl = lrcurl;
    }

    public Long getNum() {
        return num;
    }

    public void setNum(Long num) {
        this.num = num;
    }

    public Long getMusicid() {
        return musicid;
    }

    public void setMusicid(Long musicid) {
        this.musicid = musicid;
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

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
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

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
        this.lrcurl= GetLrc.getLrc(url,this.path);
    }

    public String getAlbumname() {
        return albumname;
    }

    public void setAlbumname(String albumname) {
        this.albumname = albumname;
    }

    public String getArtistname() {
        return artistname;
    }

    public void setArtistname(String artistname) {
        this.artistname = artistname;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
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

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
        this.lrcurl= GetLrc.getLrc(this.url,path);
    }

    public Long getPoster() {
        return poster;
    }

    public void setPoster(Long poster) {
        this.poster = poster;
    }

    public String getPosterurl() {
        return posterurl;
    }

    public void setPosterurl(String posterurl) {
        this.posterurl = posterurl;
    }

    @Override
    public String toString() {
        return JSON.toJSONString(this);
    }
}
