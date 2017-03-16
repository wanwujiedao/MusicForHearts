package com.dao.music.service;

import com.dao.music.base.daomain.Page;
import com.dao.music.base.utils.DateUtils;
import com.dao.music.daomain.service.IAdviceService;
import com.dao.music.daomain.vo.Advice;
import com.dao.music.mapper.AdviceDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * Created by admin on 2016/3/28.
 */
@Service
public class AdviceService implements IAdviceService {

    @Autowired
    private AdviceDao adviceDao;

    @Override
    public void insetAdvice(Advice advice) {
        advice.setAddtime(DateUtils.doFormatDate(new Date(), "yyyy-MM-dd"));
        adviceDao.insert(advice);
    }

    @Override
    public Page<Advice> findByUserId(Page<Advice> page) {
        List<Advice> advices = adviceDao.findByUserId(page);
        page.setRows(advices);
        Long total = adviceDao.getTotalByUser(page);

        page.setTotal(total);
        return page;

    }

    public void deleteAdviceById(Advice advice) {
        adviceDao.deleteById(advice);
    }
}
