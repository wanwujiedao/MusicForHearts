package com.dao.music.mapper;

import com.dao.music.base.dao.EntityDao;
import com.dao.music.daomain.vo.User;
import org.springframework.stereotype.Repository;

/**
 * Created by dzx on 2016/3/19.
 */
@Repository
public interface UserDao extends EntityDao<User> {

    User isLogin(User user);
    Integer findUserByUsername(User user);
}
