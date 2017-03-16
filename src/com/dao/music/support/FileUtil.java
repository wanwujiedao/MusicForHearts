package com.dao.music.support;

import com.dao.music.base.utils.DateUtils;
import com.dao.music.base.utils.GetPoster.VideoThumbTaker;
import com.dao.music.base.utils.KeyCode;
import com.dao.music.daomain.dto.MusicInfo;
import com.dao.music.daomain.service.IMyfileService;
import com.dao.music.daomain.vo.Myfile;
import com.dao.music.service.MyfileService;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.Date;
import java.util.UUID;


public class FileUtil {
    public static final String rootPath = "E:/resource/";
    public static final String rootUrl = "/sources/";

    public static final String avatarLocation = "useravatar/";
    public static final String musiclistLocation = "musiclist/";
    public static final String posterLocation = "poster/";
    public static final String mvLocation = "MV/";
    public static final String songLocation = "song/";


    private static IMyfileService myfileService = (MyfileService) MyBeanFactory.getBean("myfileService");
    /**
     * 默认用户头像
     */

    /**
     * 音乐列表 默认图片
     */
    public static final String defaultsUserCover = "E:/resource/useravatar/default_avatar.png";
    public static final String defaultsMusiclistCover = "E:/resource/musiclist/default_musiclist.jpg";
    public static final String getDefaultsMusicCover = "E:/resource/poster/default_music.jpg";

    /**
     * 将所给的文件存储到location对于的地址中，并在数据库中增加记录
     *
     * @param location 相对于跟路径（E:/develop | /sources）后的路径
     * @param file     从request中获取到的 MultipartFile 类型的参数
     * @return 文件在tb_myFile 中的 ID
     */
    public static Long saveFile(String location, MultipartFile file, Integer type) {
        Myfile myfile = new Myfile();
        String filename = UUID.randomUUID() + "." + file.getOriginalFilename().split("\\.")[1];
        String path = rootPath + location + filename;
        String url = rootUrl + location + filename;

        try {
            file.transferTo(new File(path));
            myfile.setPath(path);
            myfile.setUrl(url);
            myfile.setAddtime(DateUtils.doFormatDate(new Date(), "yyyy-MM-dd"));
            DecimalFormat df = new DecimalFormat("#.##");
            if (type == 0) {
                myfile.setSize(df.format(file.getSize() / 1024) + "KB");
            } else {
                myfile.setSize(df.format(file.getSize() / (1024 * 1024)) + "MB");
            }
            myfile.setFiletype(type);

            myfileService.insertMyfile(myfile);

        } catch (IOException e) {
            System.out.println("上传文件失败");
            e.printStackTrace();
        }

        return myfileService.getMyfileIDByPath(path);
    }

    /**
     * 添加用户的头像，若空则返回默认的图片所对应的ID
     *
     * @param file
     * @return 图片ID
     */
    public static Long saveUserFile(MultipartFile file, Integer type) {
        System.out.println(file.isEmpty() + ":" + file.getSize());
        if (file == null || file.isEmpty()) {
            return myfileService.getMyfileIDByPath(defaultsUserCover);
        } else {
            return saveFile(avatarLocation, file, type);
        }
    }


    /**
     * 为 Musiclist 添加封面，用户上传封面的情况;
     *
     * @param file
     * @return
     */
    public static Long saveMusiclistFile(MultipartFile file, Integer type) {
        if (file == null) {
            return myfileService.getMyfileIDByPath(defaultsMusiclistCover);
        } else {
            return saveFile(musiclistLocation, file, type);
        }
    }


    public static MusicInfo saveMusic(MultipartFile music, MultipartFile photos, MusicInfo musicInfo) {
        Long musicid = 0l;
        String filename = UUID.randomUUID() + ".png";
        String picPath = rootPath + posterLocation + filename;
        String picUrl = rootUrl + posterLocation + filename;

        if (music.getOriginalFilename().split("\\.")[1] == "mp4") {
            musicid = saveFile(mvLocation, music, KeyCode.MUSIC);
        } else {
            musicid = saveFile(songLocation, music, KeyCode.MUSIC);
        }
        musicInfo.setMusicid(musicid);
        musicInfo.setTime(VideoThumbTaker.GetMvTime(picPath));
        if (photos == null) {
            if (music.getOriginalFilename().split("\\.")[1] == "mp4") {
                Myfile myfile = myfileService.findMyfileById(musicid);
                VideoThumbTaker.TranPoster(myfile.getPath(), picPath);
                musicInfo.setPoster(saveMVPoster(picPath, picUrl));
                musicInfo.setType(KeyCode.MV);
            } else {
                musicInfo.setPoster(myfileService.getMyfileIDByPath(defaultsMusiclistCover));
                musicInfo.setType(KeyCode.SONG);
            }
        } else {
            musicInfo.setPoster(saveFile(posterLocation, photos, KeyCode.PICTURE));
        }

        return musicInfo;
    }

    public static Long saveMVPoster(String picPath, String picUrl) {
        Myfile myfile = new Myfile();
        myfile.setFiletype(KeyCode.PICTURE);
        myfile.setPath(picPath);
        myfile.setUrl(picUrl);
        File file = new File(picPath);
        myfile.setSize(file.length() / 1024 + "KB");
        myfile.setAddtime(DateUtils.doFormatDate(new Date(), "yyyy-MM-dd"));
        myfileService.insertMyfile(myfile);
        return myfileService.getMyfileIDByPath(picPath);
    }
}
