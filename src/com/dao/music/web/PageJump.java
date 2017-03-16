package com.dao.music.web;

import com.dao.music.base.utils.PageKeyToWeb;
import com.dao.music.base.utils.PageUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.MatrixVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * 用来页面跳转的
 * Created by dzx on 2016/1/26 0026.
 */
@Controller
@RequestMapping("/page")
public class PageJump {


    /**
     * 跳转到主页
     *
     * @param model
     * @return
     */
    @RequestMapping("/home")
    public String toHome(Model model, String islogintrue) {
        model.addAttribute("islogintrue", islogintrue);
        return toPage(model, PageUtils.HOME);
    }

    /**
     * 跳转到所有mv界面
     *
     * @param model
     * @return
     */
    @RequestMapping("/mv-showall")
    public String toAllMV(Model model) {
        return toPage(model, PageUtils.MV_SHOWALL);
    }

    /**
     * 跳转mv排行榜页面
     *
     * @param model
     * @return
     */
    @RequestMapping("/mv-ranking")
    public String toMVRanking(Model model) {
        return toPage(model, PageUtils.MV_RANKING);
    }

    /**
     * 跳转到mv分类
     *
     * @param model
     * @return
     */
    @RequestMapping("/mv-groups")
    public String toMVGroups(Model model) {
        return toPage(model, PageUtils.MV_GROUPS);
    }

    /**
     * 跳转到所有歌曲页面
     *
     * @param model
     * @return
     */
    @RequestMapping("/song-showall")
    public String toAllSong(Model model) {
        return toPage(model, PageUtils.SONG_SHOWAll);
    }

    /**
     * 跳转到歌曲排行
     *
     * @param model
     * @return
     */
    @RequestMapping("/song-ranking")
    public String toSongRanking(Model model) {
        return toPage(model, PageUtils.SONG_RANKING);
    }

    /**
     * 跳转到音乐分类
     *
     * @param model
     * @return
     */
    @RequestMapping("/song-groups")
    public String toSongGroup(Model model) {
        return toPage(model, PageUtils.SONG_GROUPS);
    }

    /**
     * 跳转到一展歌喉界面
     *
     * @param model
     * @return
     */
    @RequestMapping("/personal-song")
    public String toPersonalSong(Model model) {
        return toPage(model, PageUtils.PERSONAL_SONG);
    }

    /**
     * 跳转到唯美画面界面
     *
     * @param model
     * @return
     */
    @RequestMapping("/personal-mv")
    public String toPersonalMV(Model model) {
        return toPage(model, PageUtils.PERSONAL_MV);
    }

    /**
     * 跳转到所有歌手界面
     *
     * @param model
     * @return
     */
    @RequestMapping("/artist-showall")
    public String toAtistShowall(Model model) {
        return toPage(model, PageUtils.ALLARTIST);
    }

    /**
     * 跳转到建议与评价界面
     *
     * @param model
     * @return
     */
    @RequestMapping("/say-advice")
    public String toAdvice(Model model) {
        return toPage(model, PageUtils.ADVICE);
    }

    /**
     * 跳转到举报界面
     *
     * @param model
     * @return
     */
    @RequestMapping("/say-complain")
    public String toComplain(Model model) {
        return toPage(model, PageUtils.COMPLAIN);
    }

    /**
     * 跳转到搜索界面
     *
     * @param model
     * @return
     */
    @RequestMapping("/search")
    public String toSearch(Model model, String search) {
        model.addAttribute("musickeyword", search);
        return toPage(model, PageUtils.SEARCH);
    }

    /**
     * 跳转到通知界面
     *
     * @param model
     * @return
     */
    @RequestMapping("/notice")
    public String toNotice(Model model) {
        return toPage(model, PageUtils.NOTICE);
    }

    /**
     * 跳转到注册界面
     *
     * @param model
     * @return
     */
    @RequestMapping("/register")
    public String toRegister(Model model) {
        return toPage(model, PageUtils.REGISTER);
    }

    /**
     * 跳转到个人中心界面
     *
     * @param model
     * @return
     */
    @RequestMapping("/user-center")
    public String toUserCenter(Model model) {
        model.addAttribute("toHome", "toHome");
        return toPage(model, PageUtils.USER_CENTER);
    }

    /**
     * 跳转到设置中心界面
     *
     * @param model
     * @return
     */
    @RequestMapping("/user-setting")
    public String toUserSetting(Model model) {
        model.addAttribute("toHome", "toHome");
        return toPage(model, PageUtils.USER_SETTING);
    }

    @RequestMapping("/user-manage")
    public ModelAndView toManage(){
        return new ModelAndView("redirect:/manage/user-show");

    }


    /**
     * 跳转到单首歌曲播放界面
     *
     * @param model
     * @return
     */
    @RequestMapping("/song-player")
    public String toSongPlayer(Model model,Long id) {
        model.addAttribute("song_id", id);
        return toPage(model, PageUtils.SONG_PLAYER);
    }

    /**
     * 跳转到MV播放界面
     *
     * @param model
     * @return
     */
    @RequestMapping("/mv-player")
    public String toMVPLAYER(Model model, Long id)

    {
        model.addAttribute("mv_id", id);
        return toPage(model, PageUtils.MV_PLAYER);
    }

    /**
     * 跳转到专辑界面
     *
     * @param model
     * @return
     */
    @RequestMapping("/album")
    public String toAlbum(Model model, Long albumid) {
        model.addAttribute("albumid", albumid);
        return toPage(model, PageUtils.ALBUM);
    }

    /**
     * 跳转到单个歌手界面
     *
     * @param model
     * @return
     */
    @RequestMapping("/artist")
    public String toArtist(Model model, Long id) {
        model.addAttribute("id", id);
        return toPage(model, PageUtils.ARTIST);
    }


    /**
     * 跳转到页面
     *
     * @param model
     * @param page
     * @return
     */
    public String toPage(Model model, Integer page) {
        model.addAttribute("page", page);
        model.addAttribute("pageutils", new PageKeyToWeb());

        return "page";
    }

}
