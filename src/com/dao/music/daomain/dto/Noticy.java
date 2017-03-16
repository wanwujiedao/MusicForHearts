package com.dao.music.daomain.dto;

import com.alibaba.fastjson.JSON;
import com.dao.music.base.dao.Entity;

/**
 * 消息
 * Created by dzx on 2016/3/29.
 */
public class Noticy extends Entity {
    private Long id;//唯一主键
    private Long creator;//创建者id
    private String creatorname;//创建者名称
    private Long target;//发给谁？0表示所有人，否则对应Id则表示某个用户
    private String targetname;//发给用户名称
    private String title;//标题
    private String notice;//内容
    private String addtime;//添加时间
    private Integer noticyflag;//标志（0表示删除，1表示未读，2表示已读）

    public Integer getNoticyflag() {
        return noticyflag;
    }

    public void setNoticyflag(Integer noticyflag) {
        this.noticyflag = noticyflag;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getCreator() {
        return creator;
    }

    public void setCreator(Long creator) {
        this.creator = creator;
    }

    public String getCreatorname() {
        return creatorname;
    }

    public void setCreatorname(String creatorname) {
        this.creatorname = creatorname;
    }

    public Long getTarget() {
        return target;
    }

    public void setTarget(Long target) {
        if(target==0){
            targetname="所有人";
        }
        this.target = target;
    }

    public String getTargetname() {
        return targetname;
    }

    public void setTargetname(String targetname) {
        this.targetname = targetname;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getNotice() {
        return notice;
    }

    public void setNotice(String notice) {
        this.notice = notice;
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
