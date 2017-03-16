package com.dao.music.daomain.service;

import com.dao.music.base.daomain.Page;
import com.dao.music.daomain.dto.Comment;

/**
 * Created by admin on 2016/4/22.
 */
public interface ICommentService {

    Page<Comment> findComment(Page<Comment> page);

  void saveComment(Comment comment);

}
