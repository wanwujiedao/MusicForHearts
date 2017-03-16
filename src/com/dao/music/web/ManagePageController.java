package com.dao.music.web;

import com.dao.music.base.utils.PageKeyToWeb;
import com.dao.music.base.utils.PageUtils;
import com.dao.music.daomain.dto.MusicInfo;
import com.dao.music.daomain.dto.Noticy;
import com.dao.music.daomain.service.IMusicInfoService;
import com.dao.music.daomain.service.INoticyService;
import com.dao.music.daomain.vo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by admin on 2016/5/5.
 */
@Controller
@RequestMapping("/manage")
public class ManagePageController {

    @Autowired
    private INoticyService noticyService;

    @Autowired
    private IMusicInfoService musicInfoService;

    //跳转到用户管理
    @RequestMapping("/user-show")
    public String toUserShow(Model model) {
        return toManage(model, PageUtils.MANAGE_USER_SHOW);
    }


    //跳转到音乐管理界面
    @RequestMapping("/music-show")
    public String toMusicShow(Model model) {
        return toManage(model, PageUtils.MANAGE_MUSIC_SHOW);
    }


    //跳转到增加音乐信息界面
    @RequestMapping("/music-add")
    public String toMusicAdd(Model model) {
        return toManage(model, PageUtils.MANAGE_MUSIC_ADD);
    }

    //跳转到音乐修改界面
    @RequestMapping("/music-edit")
    public String toMusicEdit(Model model, MusicInfo musicInfo) {
        System.err.println(musicInfoService.findMusicById(musicInfo));
        model.addAttribute("music", musicInfoService.findMusicById(musicInfo));
        return toManage(model, PageUtils.MANAGE_MUSIC_EDIT);
    }

    //跳转到留言管理界面
    @RequestMapping("/advice-show")
    public String toAdviceShow(Model model) {
        return toManage(model, PageUtils.MANAGE_ADVICE_SHOW);
    }

    //跳转到通知消息界面
    @RequestMapping("/noticy-show")
    public String toNoticyShow(Model model) {
        return toManage(model, PageUtils.MANAGE_NOTICY_SHOW);
    }

    //跳转到通知消息发布界面
    @RequestMapping("/noticy-add")
    public String toNoticyAdd(Model model) {
        return toManage(model, PageUtils.MANAGE_NOTICY_ADD);
    }

    //跳转到通知消息修改界面
    @RequestMapping("/noticy-edit")
    public String toNoticyEdit(Model model, Noticy noticy) {
        model.addAttribute("noticy", noticyService.findById(noticy));
        return toManage(model, PageUtils.MANAGE_NOTICY_EDIT);
    }

    //跳转到举报界面
    @RequestMapping("/complain-show")
    public String toComplainShow(Model model) {
        return toManage(model, PageUtils.MANAGE_COMPLAIN_SHOW);
    }

    //跳转到超管界面
    @RequestMapping("/super-manage")
    public String toSuperManage(Model model) {
        return toManage(model, PageUtils.MANAGE_SUPER_SHOW);
    }

    @RequestMapping("/home-page")
    public ModelAndView toHome() {
        return new ModelAndView("redirect:/page/home");
    }


    /**
     * 跳转到页面
     *
     * @param model
     * @param page
     * @return
     */
    public String toManage(Model model, Integer page) {
        model.addAttribute("page", page);
        model.addAttribute("pageutils", new PageKeyToWeb());
        return "manage";
    }
}
