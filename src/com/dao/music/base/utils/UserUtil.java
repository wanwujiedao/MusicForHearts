package com.dao.music.base.utils;

import com.dao.music.daomain.vo.User;

import java.util.List;

/**
 * Created by admin on 2016/3/18.
 */
public class UserUtil {


    public static User toGrade(User user){
        user.setGrade(getGrade(user.getExperience()));
        return user;
    }

   private static Integer getGrade(Integer experience){
       Integer ex=1;
       Integer step=1;
       while(ex<experience){
            step++;
            ex=step*(step+1);
       }
       return step-1;
    }

    public static List<User> toGrade(List<User> users){
        for(User user :users){
            user.setGrade(getGrade(user.getExperience()));
        }
        return users;
    }

    public static Integer toGrade(Integer experience){
        return getGrade(experience);
    }
}
