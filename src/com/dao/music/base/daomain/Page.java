package com.dao.music.base.daomain;
import com.alibaba.fastjson.JSON;

import java.io.Serializable;
import java.util.List;

/**
 * dao层使用的分页信息
 *
 * @author dongzhuxu
 * @create 2016-01-07-10:54
 **/
public class Page<T> implements Serializable {
    //页面大小
    private Integer pagesize;
    //当前页
    private Integer pagenum;
    //起始标志
    private Integer pagestart;
    //结束标志
    private Integer pageend;
    //总数
    private Long total;
    //数据
    private List<T> rows;

    private Integer type;

    private String country;

    private String years;

    private String genre;

    private String search;

    private Long albumid;
    private Long artistid;
    private Long userid;

    private Long musicid;

    public Long getMusicid() {
        return musicid;
    }

    public void setMusicid(Long musicid) {
        this.musicid = musicid;
    }

    public Long getUserid() {
        return userid;
    }

    public void setUserid(Long userid) {
        this.userid = userid;
    }

    public Long getArtistid() {
        return artistid;
    }

    public void setArtistid(Long artistid) {
        this.artistid = artistid;
    }

    public Long getAlbumid() {
        return albumid;
    }

    public void setAlbumid(Long albumid) {
        this.albumid = albumid;
    }

    public String getSearch() {
        return search;
    }

    public void setSearch(String search) {
        this.search = '%'+search+'%';
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getYears() {
        return years;
    }

    public void setYears(String years) {
        this.years = years;
    }

    public String getGenre() {
        return genre;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }

    public void setPagestart(Integer pagestart) {
        this.pagestart = pagestart;
    }

    public void setPageend(Integer pageend) {
        this.pageend = pageend;
    }

    public Page(Integer pagesize, Integer pagenum, Integer type){
        this.type=type;
        this.pagenum=pagenum;
        this.pagesize=pagesize;
        this.pagestart=(pagenum-1)*pagesize+1;
        this.pageend=pagenum*pagesize;
    }
    public Page(Integer pagesize, Integer pagenum){
        this.pagenum=pagenum;
        this.pagesize=pagesize;
        this.pagestart=(pagenum-1)*pagesize+1;
        this.pageend=pagenum*pagesize;
    }
    public Page(Integer type){
        this.type=type;
    }
    public Page(){}
    public Integer getPagesize() {
        return pagesize;
    }

    public void setPagesize(Integer pagesize) {
        this.pagesize = pagesize;
    }

    public Integer getPagenum() {
        return pagenum;
    }

    public void setPagenum(Integer pagenum) {
        this.pagenum = pagenum;
    }

    public Integer getPagestart() {
        return pagestart;
    }



    public Integer getPageend() {
        return pageend;
    }



    public Long getTotal() {
        return total;
    }

    public void setTotal(Long total) {
        this.total = total;
    }

    public List<T> getRows() {
        return rows;
    }

    public void setRows(List<T> rows) {
        this.rows = rows;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    @Override
    public String toString() {
        return JSON.toJSONString(this);
    }
}