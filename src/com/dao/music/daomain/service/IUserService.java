package com.dao.music.daomain.service;

import com.dao.music.base.daomain.Page;
import com.dao.music.daomain.vo.User;

/**
 * Created by dzx on 2016/3/19.
 */
public interface IUserService {
     User isLogin(User user);
     User findUserById(User user);
     Integer findUserByUsername(User user);
     void insertUser(User user);
     void updateUserByUsername(User user);
     void changepwd(User user);
     Page<User> findUser(Page<User> page);
}
