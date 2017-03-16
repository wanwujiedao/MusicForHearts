package com.dao.music.base.dao;

import com.dao.music.base.daomain.Page;

import java.util.List;

/**
 * Created by dzx on 2016/1/25 0025.
 */
public interface EntityDao<T> {

    List<T> find(Page<T> page);
    T findById(T t);
    Long getTotal(Page<T> page);
    Long SearchTotal(Page<T> page);

    void insert(T t);

    void update(T t);
    void deleteById(T t);
}
