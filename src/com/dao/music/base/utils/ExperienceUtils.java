package com.dao.music.base.utils;

import com.dao.music.daomain.service.IUserService;
import com.dao.music.daomain.vo.User;
import com.dao.music.service.UserService;
import com.dao.music.support.MyBeanFactory;

import javax.servlet.http.HttpServletRequest;

/**
 * 登陆后线程经验
 * Created by admin on 2016/5/5.
 */
public class ExperienceUtils implements Runnable {


    private User user;
    private HttpServletRequest request;
    private static IUserService userService = (UserService) MyBeanFactory.getBean("userService");

    public ExperienceUtils(User user, HttpServletRequest request) {
        this.user = user;
        this.request = request;
    }

    @Override
    public void run() {
        while (true) {
            try {
                Thread.sleep(60000);//模拟一分钟经验加1
                user.setExperience(user.getExperience() + 1);
                userService.updateUserByUsername(user);
                Integer grade = UserUtil.toGrade(user.getExperience());
                user.setGrade(grade);
                request.getSession().setAttribute("currentUser", user);

            } catch (Exception e) {
            }
        }
    }
}
