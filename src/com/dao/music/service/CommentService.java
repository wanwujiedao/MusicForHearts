package com.dao.music.service;

import com.dao.music.base.daomain.Page;
import com.dao.music.base.utils.DateUtils;
import com.dao.music.daomain.dto.Comment;
import com.dao.music.daomain.service.ICommentService;
import com.dao.music.mapper.CommentDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * Created by admin on 2016/4/22.
 */
@Service
public class CommentService implements ICommentService {

    @Autowired
    private CommentDao commentDao;

    @Override
    public Page<Comment> findComment(Page<Comment> page) {
        List<Comment> comments = commentDao.find(page);
        page.setRows(comments);
        Long total = commentDao.getTotal(page);
        page.setTotal(total);
        return page;
    }

    public void saveComment(Comment comment) {
        comment.setAdddate(DateUtils.doFormatDate(new Date(), "yyyy-MM-dd HH:mm"));
        commentDao.insert(comment);
    }

}
