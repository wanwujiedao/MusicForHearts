package com.dao.music.base.utils;

import com.dao.music.base.daomain.Page;
import com.dao.music.base.daomain.SendMsg;

/**
 * Created by dzx on 2016/2/8 0008.
 */
public class SendToWeb {
    private static SendMsg sendMsg=new SendMsg();
    public  static SendMsg sendOKMsg( Page page){
       sendMsg.setFlag(KeyCode.FLAG_OK);
        sendMsg.setMsg(KeyCode.MSG_OK);
        sendMsg.setData(page);
        return sendMsg;
    }
    public  static SendMsg sendERRMsg( Page page){
        sendMsg.setFlag(KeyCode.FLAG_ERR);
        sendMsg.setMsg(KeyCode.MSG_ERR);
        return sendMsg;
    }
}
