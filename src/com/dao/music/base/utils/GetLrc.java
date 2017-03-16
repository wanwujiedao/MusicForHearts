package com.dao.music.base.utils;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;

/**
 * Created by admin on 2016/5/3.
 */
public class GetLrc {

    public static String getLrc(String songurl, String path) {
        if (songurl != null && songurl != "" && path != null && path != "") {
            String[] urls = songurl.split("/");
            urls[3] = urls[3].split("\\.")[0] + ".lrc";
            String relurl = "/" + urls[1] + "/" + urls[2] + "/lrc/" + urls[3];
            String[] paths = path.split("/");
            String relpath = paths[0] + '/' + paths[1] + '/' + paths[2] + "/lrc/" + urls[3];
            File file = new File(relpath);
            if (file.exists())
                return relurl;
            else
                return "nolrc";
        } else
            return "nolrc";
    }

    public static String getObjTxt(Integer obj){
        if(obj==1){return "MUSIC工作人员";}else if(obj==2){return "MUSIC用户";}else if(obj==3){return "MUSIC网站内容";}
        return null;
    }
}
