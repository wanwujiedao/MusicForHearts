package com.dao.music.daomain.vo;

import com.alibaba.fastjson.JSON;
import com.dao.music.base.dao.Entity;

/**
 * Created by dzx on 2016/3/28.
 */

public class Advice extends Entity {
    private Long id;//唯一主键
    private Long userid;//用户id
    private String username;
    private String content;//评价内容
    private String addtime;//添加时间

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

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getAddtime() {
        return addtime;
    }

    public void setAddtime(String addtime) {
        this.addtime = addtime;
    }

    @Override
    public String toString() {
        return JSON.toJSONString(this);
    }
}
