package com.dao.music.daomain.dto;

import com.alibaba.fastjson.JSON;

/**
 * Created by admin on 2016/5/21.
 */
public class Test {

    private Integer id;
    private String  name;
    private Long uuid;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Long getUuid() {
        return uuid;
    }

    public void setUuid(Long uuid) {
        this.uuid = uuid;
    }

    @Override
    public String toString() {
        return JSON.toJSONString(this);
    }
}
