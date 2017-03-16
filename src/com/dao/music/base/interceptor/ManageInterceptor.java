package com.dao.music.base.interceptor;

import com.dao.music.daomain.vo.User;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by admin on 2016/6/2.
 */
public class ManageInterceptor implements HandlerInterceptor{
    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {
        User user=(User)httpServletRequest.getSession().getAttribute("currentUser");
        if(user!=null){
            if(user.getPermission()<2){
              httpServletResponse.sendRedirect("/MusicForHearts/page/home");
                if("".equals())
            }
        }else{
            httpServletResponse.sendRedirect("/MusicForHearts/page/home");
        }
    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
