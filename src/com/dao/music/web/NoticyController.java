package com.dao.music.web;

import com.dao.music.base.daomain.Page;
import com.dao.music.base.daomain.SendMsg;
import com.dao.music.base.utils.SendToWeb;
import com.dao.music.daomain.dto.Noticy;
import com.dao.music.daomain.service.INoticyService;
import com.dao.music.daomain.vo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by dzx on 2016/3/29.
 */
@Controller
@RequestMapping("/noticy")
@ResponseBody
public class NoticyController {

    @Autowired
    private INoticyService noticyService;

    @RequestMapping("/find")
    public SendMsg<Noticy> find(@RequestParam(defaultValue = "10") Integer pagesize, @RequestParam(defaultValue = "1") Integer pagenum,Long userid){
        Page<Noticy> page = new Page<Noticy>(pagesize, pagenum);
        if (userid != null && userid.toString() != "") {
            page.setUserid(userid);
        }

        try {
            page =noticyService.findNoticy(page);
            return SendToWeb.sendOKMsg(page);
        } catch (Exception e) {
            System.err.print(e);
            return SendToWeb.sendERRMsg(page);
        }
    }

    @RequestMapping("/finddelete")
    public SendMsg<Noticy> findDelete(@RequestParam(defaultValue = "10") Integer pagesize, @RequestParam(defaultValue = "1") Integer pagenum,Long userid){
        Page<Noticy> page = new Page<Noticy>(pagesize, pagenum);
        if (userid != null && userid.toString() != "") {
            page.setUserid(userid);
        }

        try {
            page =noticyService.findDeleteNoticy(page);
            return SendToWeb.sendOKMsg(page);
        } catch (Exception e) {
            System.err.print(e);
            return SendToWeb.sendERRMsg(page);
        }
    }

    @RequestMapping("/ope")
    public void updateNoticy(Noticy noticy){
        noticyService.updateNoticy(noticy);
    }

    @RequestMapping("/update")
    public ModelAndView update(Noticy noticy){
        updateNoticy(noticy);
        return new ModelAndView("redirect:/manage/noticy-show");
    }
    @RequestMapping("/deleteNoticy")
    public void deleteNoticy(String ids) {
        String[] noticyids = ids.split("-");
        for (int i = 0; i < noticyids.length; i++) {
            if(noticyids[i]!=null){
                Noticy noticy = new Noticy();
                noticy.setId(Long.valueOf(noticyids[i]));
                noticyService.deletenoticyById(noticy);
            }

        }
    }


    @RequestMapping("/insertNoticy")
    public ModelAndView insertNoticy(Noticy noticy, HttpServletRequest request){
        User user = (User) request.getSession().getAttribute("currentUser");
        noticy.setCreator(user.getId());
        noticyService.insertNoticy(noticy);
        return new ModelAndView("redirect:/manage/noticy-show");
    }

}
