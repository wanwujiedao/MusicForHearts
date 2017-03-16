package com.dao.music.web;

import com.dao.music.base.daomain.Page;
import com.dao.music.base.daomain.SendMsg;
import com.dao.music.base.utils.SendToWeb;
import com.dao.music.daomain.service.IAlbumService;
import com.dao.music.daomain.vo.Album;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 专辑控制层
 * Created by dzx on 2016/3/15.
 */

@Controller
@RequestMapping("/album")
@ResponseBody
public class AlbumController {

    @Autowired
    private IAlbumService albumService;

    @RequestMapping("/findAlbumById")
    public Album findAlbumById(Album album){
        return albumService.findAlbumById(album);
    }

    @RequestMapping("/findAlbum")
    public SendMsg<Album> findAlbum(@RequestParam(defaultValue = "6")Integer pagesize, @RequestParam(defaultValue = "1") Integer pagenum,Long artistid){
        Page<Album> page = new Page<Album>(pagesize, pagenum);
        page.setArtistid(artistid);

        try {
            page = albumService.findAlbum(page);
            return SendToWeb.sendOKMsg(page);
        }catch(Exception e){
            return SendToWeb.sendERRMsg(page);
        }
    }
}
