package com.dao.music.daomain.service;

import com.dao.music.daomain.vo.Myfile;

/**
 * Created by dzx on 2016/3/21.
 */
public interface IMyfileService {
  void insertMyfile(Myfile myfile);
  Long getMyfileIDByPath(String path);
  Myfile findMyfileById(Long id);
}
