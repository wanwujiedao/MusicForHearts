package com.dao.music.daomain.dto;

import com.dao.music.base.dao.Entity;

/**
 * Created by admin on 2016/4/22.
 */
public class Comment extends Entity {

    private Long id;//评论id;
    private Long userid;
    private Long musicid;

    private String adddate;
    private String content;//评论内容

    private String userposter;//用户图像
    private String username;

    public String getUsername() {

        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getUserid() {
        return userid;
    }

    public void setUserid(Long userid) {
        this.userid = userid;
    }

    public Long getMusicid() {
        return musicid;
    }

    public void setMusicid(Long musicid) {
        this.musicid = musicid;
    }

    public String getAdddate() {
        return adddate;
    }

    public void setAdddate(String adddate) {
        this.adddate = adddate;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getUserposter() {
        return userposter;
    }

    public void setUserposter(String userposter) {
        this.userposter = userposter;
    }
}
