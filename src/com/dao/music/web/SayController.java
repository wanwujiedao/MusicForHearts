package com.dao.music.web;

import com.dao.music.base.daomain.Page;
import com.dao.music.base.daomain.SendMsg;
import com.dao.music.base.utils.SendToWeb;
import com.dao.music.daomain.service.IAdviceService;
import com.dao.music.daomain.service.IComplainService;
import com.dao.music.daomain.vo.Advice;
import com.dao.music.daomain.vo.Complain;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * Created by dzx on 2016/3/21.
 */
@Controller
@RequestMapping("/say")
public class SayController {
    @Autowired
    private IComplainService complainService;

    @Autowired
    private IAdviceService adviceService;

    @RequestMapping("/insertComplain")
    public ModelAndView insertComplain(Complain complain) {
        complainService.insert(complain);
        return new ModelAndView("redirect:/page/home");
    }

    @RequestMapping("/insertAdvice")
    public ModelAndView insertAdvice(Advice advice) {
        adviceService.insetAdvice(advice);
        return new ModelAndView("redirect:/page/home");
    }

    @RequestMapping("/getUserAdvice")
    @ResponseBody
    public SendMsg<Advice> getUserAdvice(@RequestParam(defaultValue = "10") Integer pagesize, @RequestParam(defaultValue = "1") Integer pagenum, Advice advice) {
        Page<Advice> page = new Page<Advice>(pagesize, pagenum);
        if (advice.getUserid() != null && advice.getUserid().toString() != "") {
            page.setUserid(advice.getUserid());
        }

        try {
            page = adviceService.findByUserId(page);
            return SendToWeb.sendOKMsg(page);
        } catch (Exception e) {
            System.err.print(e);
            return SendToWeb.sendERRMsg(page);
        }
    }

    @RequestMapping("/getComplain")
    @ResponseBody
    public SendMsg<Complain> getComplain(@RequestParam(defaultValue = "10") Integer pagesize, @RequestParam(defaultValue = "1") Integer pagenum, Complain complain) {
        Page<Complain> page = new Page<Complain>(pagesize, pagenum);


        try {
            page = complainService.findComplain(page);
            return SendToWeb.sendOKMsg(page);
        } catch (Exception e) {
            System.err.print(e);
            return SendToWeb.sendERRMsg(page);
        }
    }

    @RequestMapping("/deleteAdvice")
    @ResponseBody
    public void deleteAdvice(String ids) {
        String[] adviceids = ids.split("-");
        for (int i = 0; i < adviceids.length; i++) {
            Advice advice = new Advice();
            advice.setId(Long.valueOf(adviceids[i]));
            adviceService.deleteAdviceById(advice);
        }
    }
    @RequestMapping("/deleteComplain")
    @ResponseBody
    public void deleteComplain(String ids) {
        String[] complainids = ids.split("-");
        for (int i = 0; i < complainids.length; i++) {
            Complain complain = new Complain();
            complain.setId(Long.valueOf(complainids[i]));
            complainService.deleteComplainById(complain);
        }
    }

}
