package com.dao.music.web;

import com.alibaba.fastjson.JSON;
import com.dao.music.base.daomain.Page;
import com.dao.music.base.daomain.SendMsg;
import com.dao.music.base.utils.SendToWeb;
import com.dao.music.base.utils.smartUpload.SmartUpload;
import com.dao.music.daomain.dto.MusicInfo;
import com.dao.music.daomain.dto.MusicRanking;
import com.dao.music.daomain.service.IMusicInfoService;
import com.dao.music.daomain.vo.Music;
import com.dao.music.service.MusicInfoService;
import com.dao.music.support.FileUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by dzx on 2016/2/8 0008.
 */
@Controller
@RequestMapping("/music")
@ResponseBody
public class MusicController {

    @Autowired
    private IMusicInfoService musicInfoService;


    //按特定条件查询music
    @RequestMapping("/findMusicInfo")
    public SendMsg<MusicInfo> findMusicInfo(@RequestParam(defaultValue = "12") Integer pagesize, @RequestParam(defaultValue = "1") Integer pagenum, Integer type, Long albumid, Long artistid) {
        Page<MusicInfo> page = new Page<MusicInfo>(pagesize, pagenum, type);
        if (albumid != null && albumid.toString() != "") {
            page.setAlbumid(albumid);
        }

        if (artistid != null && artistid.toString() != "") {
            page.setArtistid(artistid);
        }

        try {
            page = musicInfoService.findMusicInfo(page);
            return SendToWeb.sendOKMsg(page);
        } catch (Exception e) {
            return SendToWeb.sendERRMsg(page);
        }
    }

    //随机4个mv
    @RequestMapping("/findMusicInfoByRadom")
    public SendMsg<MusicInfo> findMusicInfoByRadom(Integer type, Integer num) {
        Page<MusicInfo> page = new Page<MusicInfo>(type);
        try {

            page = musicInfoService.findMusicInfoByRadom(page, num);
            return SendToWeb.sendOKMsg(page);
        } catch (Exception e) {
            return SendToWeb.sendERRMsg(page);
        }
    }


    //获取单独播放音乐信息
    @RequestMapping("/toPlay")
    public MusicInfo toPlay(MusicInfo musicInfo) {
        return musicInfoService.findMusicById(musicInfo);
    }


    //获取音乐排行
    @RequestMapping("/ranking")
    public SendMsg<MusicRanking> findMusicInfoByRanking(@RequestParam(defaultValue = "10") Integer pagesize, @RequestParam(defaultValue = "1") Integer pagenum, Integer type) {
        Page<MusicRanking> page = new Page<MusicRanking>(pagesize, pagenum, type);
        try {

            page = musicInfoService.findMusicInfoByRanking(page);
            return SendToWeb.sendOKMsg(page);
        } catch (Exception e) {
            return SendToWeb.sendERRMsg(page);
        }
    }

    //音乐分类查询
    @RequestMapping("/groups")
    public SendMsg<MusicInfo> findMusicInfoByGroups(@RequestParam(defaultValue = "10") Integer pagesize, @RequestParam(defaultValue = "1") Integer pagenum, Integer type, String country, String genre, String years) {
        Page<MusicInfo> page = new Page<MusicInfo>(pagesize, pagenum, type);
        if (country != null && country != "") {
            page.setCountry(country);
        }

        if (genre != null && genre != "") {
            page.setGenre(genre);
        }

        if (years != null && years != "") {
            page.setYears(years);
        }


        try {
            page = musicInfoService.findMusicInfo(page);
            return SendToWeb.sendOKMsg(page);
        } catch (Exception e) {
            return SendToWeb.sendERRMsg(page);
        }

    }

    //音乐查询
    @RequestMapping("/search")
    public SendMsg<MusicInfo> findMusicInfoBy(Model model, @RequestParam(defaultValue = "10") Integer pagesize, @RequestParam(defaultValue = "1") Integer pagenum, Integer type, String search) {
        Page<MusicInfo> page = new Page<MusicInfo>(pagesize, pagenum, type);
        page.setSearch(search);
        try {
            page = musicInfoService.findMusicBySearch(page);
            model.addAttribute("keyword", search);
            return SendToWeb.sendOKMsg(page);
        } catch (Exception e) {
            return SendToWeb.sendERRMsg(page);
        }
    }


    //音乐下载

    @RequestMapping("/download")
    public void downloadMusic(MusicInfo musicInfo, HttpServletRequest request, HttpServletResponse response) throws Exception {

        MusicInfo music = musicInfoService.findMusicById(musicInfo);
        Music music0 = new Music();
        music0.setId(music.getId());
        music0.setDownloadcount(music.getDownloadcount() + 1);
        musicInfoService.update(music0);
        String file = music.getPath();


        SmartUpload su = new SmartUpload();


        su.initialize(request.getServletContext(), request, response);
        su.setContentDisposition(null);
        su.downloadFile(file);


    }

    @RequestMapping("/userMusic")
    public SendMsg<MusicInfo> findMusicByUser(@RequestParam(defaultValue = "12") Integer pagesize, @RequestParam(defaultValue = "1") Integer pagenum, Integer type, Long userid) {
        Page<MusicInfo> page = new Page<MusicInfo>(pagesize, pagenum, type);
        if (userid != null && userid.toString() != "") {
            page.setUserid(userid);
        }

        try {
            page = musicInfoService.findMusicByUser(page);
            return SendToWeb.sendOKMsg(page);
        } catch (Exception e) {
            return SendToWeb.sendERRMsg(page);
        }
    }

    @RequestMapping("/update")
    public void update(Music music) {

        music.setPlaycount(music.getPlaycount() + 1);

        musicInfoService.update(music);
    }

    @RequestMapping("/addCollectcount")
    public void addCollect(MusicInfo musicInfo) {
        MusicInfo music = musicInfoService.findMusicById(musicInfo);

        Music music0 = new Music();
        music0.setId(music.getId());
        music0.setCollectcount(music.getCollectcount() + 1);

        musicInfoService.update(music0);
    }

    @RequestMapping("/deletemusic")
    public void deleteMusic(String ids) {
        String[] musicids = ids.split("-");
        for (int i = 0; i < musicids.length; i++) {
            if (musicids[i] != null) {
                MusicInfo music = new MusicInfo();
                music.setId(Long.valueOf(musicids[i]));
                musicInfoService.deleteMusicById(music);
            }

        }
    }
    @RequestMapping("/insertMusic")
    public ModelAndView insertMusic(MusicInfo musicInfo, @RequestParam(value = "photos", required = false) CommonsMultipartFile photos, @RequestParam(value = "music", required = false) CommonsMultipartFile music, Long[] typeid){
        //System.err.println("结果"+musicInfo+ JSON.toJSONString(typeid));

        //处理图片和音乐文件流
        musicInfo= FileUtil.saveMusic(photos,music,musicInfo);
        //将信息插入音乐表
        musicInfoService.insertMusic(musicInfo);
        //将类型绑定音乐信息
        musicInfo=musicInfoService.findMusicByPath(musicInfo);
        for(Long tid:typeid ){
            musicInfo.setTypeid(tid);
            musicInfoService.saveType(musicInfo);
        }
        return new ModelAndView("redirect:/manage/music-show");
    }

    //更新音乐信息
    @RequestMapping("/updateMusic")
    public ModelAndView updateMusic(MusicInfo musicInfo, @RequestParam(value = "photos", required = false) CommonsMultipartFile photos, @RequestParam(value = "music", required = false) CommonsMultipartFile music, Long[] typeid){
        if (photos == null || photos.isEmpty()) {
            System.err.print("封面未改变");

        }else{

        }

        return new ModelAndView("redirect:/manage/music-show");

    }

}
