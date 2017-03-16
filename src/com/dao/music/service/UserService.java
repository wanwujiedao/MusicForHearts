package com.dao.music.service;

import com.dao.music.base.daomain.Page;
import com.dao.music.base.utils.DateUtils;
import com.dao.music.base.utils.KeyCode;
import com.dao.music.daomain.service.IUserService;
import com.dao.music.daomain.vo.User;
import com.dao.music.mapper.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Date;
import java.util.List;

/**
 * Created by admin on 2016/3/19.
 */
@Service
public class UserService implements IUserService {
    @Autowired
    private UserDao userDao;

    @Override
    public User isLogin(User user) {
        user=userDao.isLogin(user);
        return user;
    }

    @Override
    public User findUserById(User user) {
        return userDao.findById(user);
    }

    @Override
    public Integer findUserByUsername(User user) {
        return userDao.findUserByUsername(user);
    }

    @Override
    public void insertUser(User user) {
        Date date=new Date();
        String time= DateUtils.doFormatDate(date,"yyyy-MM-dd HH:mm:ss");
        user.setAddtime(time);
        user.setExperience(KeyCode.EXPERENCE_START);
        user.setPermission(KeyCode.PERMISSION_START);
        userDao.insert(user);
    }

    public void updateUserByUsername(User user){

        userDao.update(user);
    }

    @Override
    public void changepwd(User user) {
        userDao.update(user);
    }


    public Page<User> findUser(Page<User> page){
        List<User> users =userDao.find(page);
        page.setRows(users);
        Long total = userDao.getTotal(page);
        page.setTotal(total);
        return page;
    }
}

