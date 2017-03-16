package com.dao.music.service;

import com.dao.music.base.daomain.Page;
import com.dao.music.base.utils.DateUtils;
import com.dao.music.daomain.dto.Noticy;
import com.dao.music.daomain.service.INoticyService;
import com.dao.music.mapper.NoticyDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * Created by dzx on 2016/3/29.
 */
@Service
public class NoticyService implements INoticyService {

    @Autowired
    private NoticyDao noticyDao;


    public Page<Noticy> findNoticy(Page<Noticy> page) {
        List<Noticy> noticys = noticyDao.find(page);
        page.setRows(noticys);
        Long total = noticyDao.getTotal(page);
        page.setTotal(total);

        return page;
    }

    public void updateNoticy(Noticy noticy) {
        noticyDao.update(noticy);
    }

    public Page<Noticy> findDeleteNoticy(Page<Noticy> page) {
        List<Noticy> noticys = noticyDao.findDelete(page);
        page.setRows(noticys);
        Long total = noticyDao.getTotalDelete(page);
        page.setTotal(total);
        return page;
    }

    public void deletenoticyById(Noticy noticy) {
        noticyDao.deleteById(noticy);
    }

    public void insertNoticy(Noticy noticy) {
        if(noticy.getTarget()==0){
            noticy.setNoticyflag(3);
        }else{
            noticy.setNoticyflag(1);
        }
        noticy.setAddtime(DateUtils.doFormatDate(new Date(), "yyyy-MM-dd HH:mm"));
        noticyDao.insert(noticy);
    }
    public Noticy findById(Noticy noticy){
        return noticyDao.findById(noticy);
    }
}
