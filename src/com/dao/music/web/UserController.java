package com.dao.music.web;

import com.dao.music.base.daomain.Page;
import com.dao.music.base.daomain.SendMsg;
import com.dao.music.base.utils.ExperienceUtils;
import com.dao.music.base.utils.GetPoster.VideoThumbTaker;
import com.dao.music.base.utils.KeyCode;
import com.dao.music.base.utils.SendToWeb;
import com.dao.music.base.utils.smartUpload.SmartFile;
import com.dao.music.base.utils.smartUpload.SmartUpload;
import com.dao.music.daomain.service.IUserService;
import com.dao.music.daomain.vo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;

import com.dao.music.support.FileUtil;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 * Created by dzx on 2016/3/19.
 */

@Controller
@RequestMapping("/user")
@ResponseBody
public class UserController {
    @Autowired
    private IUserService userService;

    private Thread thread;


    @RequestMapping("/islogin")
    public User isLogin(User user, HttpServletRequest request, String remenberme, Model model) {
        user = userService.isLogin(user);

        if (user != null) {
            request.getSession().setAttribute("currentUser", user);
            thread=new Thread(new ExperienceUtils(user, request));
            thread.start();//经验随时间增加而增加
            return user;
        }
        return null;
    }

    @RequestMapping("/exitlogin")
    public void exitLogin(HttpServletRequest request, Integer page, Model model) {
        thread.stop();//终止经验增加
        request.getSession().removeAttribute("currentUser");
    }

    @RequestMapping("logined")
    public User logined(HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("currentUser");
        if (user != null) {
            return user;
        } else {
            return null;
        }
    }

    @RequestMapping("usernameIsNew")
    public boolean usernameIsNew(User user) {
        if (userService.findUserByUsername(user) == 0) {
            return true;
        }
        return false;
    }

    @RequestMapping("/register")
    public ModelAndView register(Model model, User user, HttpServletRequest request, HttpServletResponse response, @RequestParam(value = "photos", required = false) CommonsMultipartFile file) {
        Long avatar = FileUtil.saveUserFile(file, KeyCode.PICTURE);
        user.setAvatar(avatar);
        if (userService.findUserByUsername(user) == 0) {
            userService.insertUser(user);
        } else {
            System.err.print("用户已注册，请不要重复注册！");
        }

        A
    }


    @RequestMapping("/changemsg")

    public ModelAndView change(User user, @RequestParam(value = "photos", required = false) CommonsMultipartFile file) {
        if (file == null || file.isEmpty()) {
            System.err.print("头像未改变");
        } else {
            Long avatar = FileUtil.saveUserFile(file, KeyCode.PICTURE);
            user.setAvatar(avatar);
        }
        userService.updateUserByUsername(user);
        return new ModelAndView("redirect:/page/home");
    }

    @RequestMapping("/changepwd")
    public ModelAndView changepwd(User user) {
        userService.changepwd(user);
        return new ModelAndView("redirect:/page/home");
    }
    @RequestMapping("/findById")
    public User findUserById(User user){
    return userService.findUserById(user);

    }
    @RequestMapping("/find")
    public SendMsg<User> getComplain(@RequestParam(defaultValue = "10") Integer pagesize, @RequestParam(defaultValue = "1") Integer pagenum) {
        Page<User> page = new Page<User>(pagesize, pagenum);


        try {
            page = userService.findUser(page);
            return SendToWeb.sendOKMsg(page);
        } catch (Exception e) {
            System.err.print(e);
            return SendToWeb.sendERRMsg(page);
        }
    }

    @RequestMapping("/lhyh")
    public void Lhyh(String ids){
        String[] userids = ids.split("-");
        for (int i = 0; i < userids.length; i++) {
            User user = new User();
            user.setId(Long.valueOf(userids[i]));
            user=findUserById(user);
            user.setPermission(0);
            userService.updateUserByUsername(user);
        }
    }

    @RequestMapping("/qxlh")
    public void Qxlh(User user){
               user.setPermission(1);
            userService.updateUserByUsername(user);
    }

    @RequestMapping("/tt")
    public void tt(){
   VideoThumbTaker.TranPoster("E:/resource/MV/Single Ladies 官方舞蹈版--音悦Tai.mp4","C:/Users/admin/Desktop/SQL/hdshj.png");
        String time=VideoThumbTaker.GetMvTime("E:/resource/MV/BLUE 中韩字幕(Double S字幕组)--音悦Tai.mp4");
        System.err.println(time);
    }
}
