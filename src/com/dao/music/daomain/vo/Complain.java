package com.dao.music.daomain.vo;


import com.alibaba.fastjson.JSON;
import com.dao.music.base.dao.Entity;
import com.dao.music.base.utils.GetLrc;

/**
 * 举报
 * Created by dzx on 2016/3/21.
 */
public class Complain extends Entity {

    private Long id;//唯一主键
    private Integer obj;
    private String objtxt;
    private String objname;//举报
    private String objcontent;//举报详情
    private String addtime;//添加时间

    public String getAddtime() {
        return addtime;
    }

    public void setAddtime(String addtime) {
        this.addtime = addtime;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Integer getObj() {
        return obj;
    }

    public void setObj(Integer obj) {

        this.obj = obj;
        this.objtxt= GetLrc.getObjTxt(obj);
    }

    public String getObjtxt() {
        return objtxt;
    }

    public void setObjtxt(String objtxt) {
        this.objtxt = objtxt;
    }

    public String getObjname() {
        return objname;
    }

    public void setObjname(String objname) {
        this.objname = objname;
    }

    public String getObjcontent() {
        return objcontent;
    }

    public void setObjcontent(String objcontent) {
        this.objcontent = objcontent;
    }



    @Override
    public java.lang.String toString() {
        return JSON.toJSONString(this);
    }
}
