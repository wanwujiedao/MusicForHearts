package com.dao.music.web;

import com.dao.music.base.daomain.Page;
import com.dao.music.base.daomain.SendMsg;
import com.dao.music.base.utils.SendToWeb;
import com.dao.music.daomain.dto.Comment;
import com.dao.music.daomain.service.ICommentService;
import com.dao.music.daomain.vo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by admin on 2016/4/22.
 */

@Controller
@RequestMapping("/comment")
@ResponseBody
public class CommentController {


    @Autowired
    private ICommentService commentService;


    @RequestMapping("/findComment")
    public SendMsg<Comment> findMusicInfo(@RequestParam(defaultValue = "5") Integer pagesize, @RequestParam(defaultValue = "1") Integer pagenum, Long musicid) {

        Page<Comment> page = new Page<Comment>(pagesize, pagenum);

        if (musicid != null && musicid.toString() != "") {
            page.setMusicid(musicid);
        }

        try {
            page = commentService.findComment(page);
            return SendToWeb.sendOKMsg(page);
        } catch (Exception e) {
            System.err.print(e);
            return SendToWeb.sendERRMsg(page);
        }
    }

    @RequestMapping("/saveComment")
    public String saveComment(Comment comment, HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("currentUser");
        if (user != null) {
            comment.setUserid(user.getId());
            commentService.saveComment(comment);

            return "ok";
        } else {

            return "fail";
        }

    }

}
