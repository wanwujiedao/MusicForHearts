package com.dao.music.daomain.dto;

import com.alibaba.fastjson.JSON;
import com.dao.music.base.dao.Entity;
import org.omg.CORBA.PRIVATE_MEMBER;

/**
 * 歌手信息
 * Created by dzx on 2016/3/9.
 */
public class ArtistInfo extends Entity{

    private Long id;//唯一主键

    private String name;//姓名

    private String sexval;//性别

    private Integer sex;

    private String birthday;//出生日期

    private String info;//详细介绍

    private String imgurl;//图片地址

    private String country;//国家

    private String watch;//关注度

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

    public String getSexval() {
        return sexval;
    }

    public void setSexval(String sexval) {
        this.sexval = sexval;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    public String getImgurl() {
        return imgurl;
    }

    public void setImgurl(String imgurl) {
        this.imgurl = imgurl;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getWatch() {
        return watch;
    }

    public void setWatch(String watch) {
        this.watch = watch;
    }

    public Integer getSex() {
        return sex;
    }

    public void setSex(Integer sex) {
        this.sex = sex;
    }

    @Override
    public String toString() {
        return JSON.toJSONString(this);
    }
}
