package com.dao.music.daomain.vo;

import com.alibaba.fastjson.JSON;
import com.dao.music.base.dao.Entity;

/**
 * Created by admin on 2016/3/21.
 */

public class Myfile extends Entity {
    private Long id;
    private String path;
    private String url;
    private String size;
    private String addtime;
    private Integer filetype;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public String getAddtime() {
        return addtime;
    }

    public void setAddtime(String addtime) {
        this.addtime = addtime;
    }

    public Integer getFiletype() {
        return filetype;
    }

    public void setFiletype(Integer filetype) {
        this.filetype = filetype;
    }

    @Override
    public String toString() {
        return JSON.toJSONString(this);
    }
}
