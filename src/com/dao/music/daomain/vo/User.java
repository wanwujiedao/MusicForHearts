package com.dao.music.daomain.vo;

import com.alibaba.fastjson.JSON;
import com.dao.music.base.dao.Entity;
import com.dao.music.base.utils.UserUtil;

/**
 * 用户vo
 * Created by dzx on 2016/3/18.
 */
public class User extends Entity{
    private Long id;
    private String username;
    private String password;
    private String email;
    private String name;
    private String sexval;
    private String qq;
    private Integer sex;
    private String tel;
    private Long avatar;
    private String userposter;
    private Integer experience;
    private Integer grade;
    private Integer permission;
    private String addtime;
    private String info;

    public Integer getSex() {
        return sex;
    }

    public void setSex(Integer sex) {
        this.sex = sex;
    }

    public String getAddtime() {
        return addtime;
    }

    public void setAddtime(String addtime) {
        this.addtime = addtime;
    }

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    public Long getAvatar() {
        return avatar;
    }

    public void setAvatar(Long avatar) {
        this.avatar = avatar;
    }

    public String getUserposter() {
        return userposter;
    }

    public void setUserposter(String userposter) {
        this.userposter = userposter;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
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

    public String getQq() {
        return qq;
    }

    public void setQq(String qq) {
        this.qq = qq;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }



    public Integer getExperience() {
        return experience;
    }

    public void setExperience(Integer experience) {
        this.experience = experience;
        this.grade= UserUtil.toGrade(experience);
    }

    public Integer getGrade() {
        return grade;
    }

    public void setGrade(Integer grade) {
        this.grade = grade;
    }

    public Integer getPermission() {
        return permission;
    }

    public void setPermission(Integer permission) {
        this.permission = permission;
    }

    @Override
    public String toString() {
        return JSON.toJSONString(this);
    }
}
