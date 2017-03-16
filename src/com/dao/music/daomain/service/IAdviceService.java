package com.dao.music.daomain.service;

import com.dao.music.base.daomain.Page;
import com.dao.music.daomain.vo.Advice;

import java.util.List;

/**
 * Created by dzx on 2016/3/28.
 */
public interface IAdviceService {
    void insetAdvice(Advice advice);
    Page<Advice> findByUserId(Page<Advice> page);
    void deleteAdviceById(Advice advice);
}
