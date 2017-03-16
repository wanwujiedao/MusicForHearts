package com.dao.music.web;

import com.dao.music.base.daomain.Page;
import com.dao.music.base.daomain.SendMsg;
import com.dao.music.base.utils.SendToWeb;
import com.dao.music.daomain.dto.ArtistInfo;
import com.dao.music.daomain.service.IArtistService;
import com.dao.music.service.ArtistService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 歌手的控制层
 * Created by dzx on 2016/3/10.
 */

@Controller
@RequestMapping("/artist")
@ResponseBody
public class ArtistController {

    @Autowired
    private IArtistService artistService;

    @RequestMapping("/findArtist")
    public SendMsg<ArtistInfo> findMusicInfo(@RequestParam(defaultValue = "5")Integer pagesize, @RequestParam(defaultValue = "1") Integer pagenum,String country){

        Page<ArtistInfo> page = new Page<ArtistInfo>(pagesize, pagenum);
        page.setCountry(country);

        try {
            page = artistService.findArtist(page);
            return SendToWeb.sendOKMsg(page);
        }catch(Exception e){
            return SendToWeb.sendERRMsg(page);
        }
    }

    @RequestMapping("/findArtistById")
    public ArtistInfo findArtistInfo(ArtistInfo artistInfo){
        return artistService.findArtistById(artistInfo);
    }


    @RequestMapping("/search")
    public SendMsg<ArtistInfo> findArtistBySearch(@RequestParam(defaultValue = "5")Integer pagesize, @RequestParam(defaultValue = "1") Integer pagenum,String search){

        Page<ArtistInfo> page = new Page<ArtistInfo>(pagesize, pagenum);
        page.setSearch(search);

        try {
            page = artistService.findBySearch(page);
            return SendToWeb.sendOKMsg(page);
        }catch(Exception e){
            return SendToWeb.sendERRMsg(page);
        }
    }


    @RequestMapping("/findArtistByRadom")
    public SendMsg<ArtistInfo> findArtistByRadom(Integer num){
        Page<ArtistInfo> page = new Page<ArtistInfo>();


        try {
            page = artistService.findRadom(page,num);
            return SendToWeb.sendOKMsg(page);
        }catch(Exception e){
            return SendToWeb.sendERRMsg(page);
        }

    }

}
