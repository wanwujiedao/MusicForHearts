package com.dao.music.service;

import com.dao.music.base.daomain.Page;
import com.dao.music.base.utils.DateUtils;
import com.dao.music.daomain.service.IComplainService;
import com.dao.music.daomain.vo.Complain;
import com.dao.music.mapper.ComplainDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by admin on 2016/3/21.
 */
@Service
public class ComplainService implements IComplainService{
    @Autowired
    private ComplainDao complainDao;
    @Override
    public void insert(Complain complain) {
        Date date=new Date();
        String time= DateUtils.doFormatDate(date,"yyyy-MM-dd HH:mm:ss");
        complain.setAddtime(time);
        complainDao.insert(complain);
    }

    public Page<Complain> findComplain(Page<Complain> page){

        List<Complain> advices = complainDao.find(page);
        page.setRows(advices);
        Long total = complainDao.getTotal(page);

        page.setTotal(total);
        return page;
    }
    public void deleteComplainById(Complain complain){
        complainDao.deleteById(complain);
    }
}
