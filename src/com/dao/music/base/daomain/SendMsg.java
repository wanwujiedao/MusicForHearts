package com.dao.music.base.daomain;

import com.alibaba.fastjson.JSON;

import java.io.Serializable;

/**
 * Created by dzx on 2016/2/8 0008.
 */
public class SendMsg<T> implements Serializable {
    private Integer flag;
    private String msg;
    private Page<T>  data;

    public Integer getFlag() {
        return flag;
    }

    public void setFlag(Integer flag) {
        this.flag = flag;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Page<T> getData() {
        return data;
    }

    public void setData(Page<T> data) {
        this.data = data;
    }

    @Override
    public String toString() {
        return JSON.toJSONString(this);
    }


}
