package com.dao.music.daomain.service;

import com.dao.music.base.daomain.Page;
import com.dao.music.daomain.vo.Complain;

/**
 * Created by admin on 2016/3/21.
 */
public interface IComplainService {
     void insert(Complain complain);
     Page<Complain> findComplain(Page<Complain> page);
     void deleteComplainById(Complain complain);
}
