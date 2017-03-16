package com.dao.music.service;

import com.dao.music.daomain.service.IMyfileService;
import com.dao.music.daomain.vo.Myfile;
import com.dao.music.mapper.MyfileDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by admin on 2016/3/21.
 */

@Service
public class MyfileService implements IMyfileService{

    @Autowired
    private MyfileDao myfileDao;

    public void insertMyfile(Myfile myfile){

            myfileDao.insert(myfile);
    }

    public Long getMyfileIDByPath(String path){
        return myfileDao.getMyfileIDByPath(path);
    }
    public Myfile findMyfileById(Long id){
        Myfile myfile=new Myfile();
        myfile.setId(id);
        return myfileDao.findById(myfile);
    }
}
