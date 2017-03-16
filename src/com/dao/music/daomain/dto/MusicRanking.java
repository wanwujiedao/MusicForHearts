package com.dao.music.daomain.dto;

/**
 * Created by dzx on 2016/2/13 0013.
 */
public class MusicRanking extends MusicInfo {
    private Float rank;

    private Long rownum;

    private String sexval;

    private String artistinfo;

    public String getArtistinfo() {
        return artistinfo;
    }

    public void setArtistinfo(String artistinfo) {
        this.artistinfo = artistinfo;
    }

    public String getSexval() {
        return sexval;
    }

    public void setSexval(String sexval) {
        this.sexval = sexval;
    }

    public Long getRownum() {
        return rownum;
    }

    public void setRownum(Long rownum) {
        this.rownum = rownum;
    }

    public Float getRank() {
        return rank;
    }

    public void setRank(Float rank) {
        this.rank = rank;
    }
}
