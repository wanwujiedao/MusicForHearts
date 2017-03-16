package com.dao.music.daomain.service;

import com.dao.music.base.daomain.Page;
import com.dao.music.daomain.dto.Noticy;

/**
 * Created by dzx on 2016/3/29.
 */
public interface INoticyService {
    Page<Noticy> findNoticy(Page<Noticy> page);
    void updateNoticy(Noticy noticy);
    Page<Noticy> findDeleteNoticy(Page<Noticy> page);
    void deletenoticyById(Noticy noticy);
    void insertNoticy(Noticy noticy);
    Noticy findById(Noticy noticy);
}
