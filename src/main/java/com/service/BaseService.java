package com.service;

import com.dao.BaseDAO;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.Collection;
import java.util.List;

@Service
@Transactional
public abstract class BaseService<T> {

    private BaseDAO<T> dao;

    @Resource
    public void setDao(BaseDAO<T> dao) {
        this.dao = dao;
    }

    // ---------------------- 查询 ------------------

    public T get(Integer id) {
        return dao.get(id);
    }

    /* 根据条件获取一个实体 */
    public T get(String hql, Object... params) {
        return dao.get(hql, params);
    }

    /* 分页获取集合 */
    public List<T> listPage(String hql, Integer pageNo, Integer pageSize) {
        return dao.listPage(hql, pageNo, pageSize);
    }

    /* 条件分页获取集合 */
    public List<T> listPageWithCondition(String hql, Integer pageNo, Integer pageSize, Object... params) {
        return dao.listPageWithCondition(hql, pageNo, pageSize, params);
    }

    /* 自定义 HQL 查询一个集合 */
    public List<T> listWithCustom(String hql, Object... params) {
        return dao.listWithCustom(hql, params);
    }

    /* 根据条件统计数量 */
    public Integer countAll() {
        return dao.countAll();
    }

    /* 根据条件统计数量 */
    public Integer countWithCondition(String hql, Object... params) {
        return dao.countWithCondition(hql, params);
    }

    /* 获取所有 */
    public List<T> listAll() {
        return dao.listAll();
    }

    /* 获取 MySQL 版本号 */
    public Object getMySQLVersio() {
        return dao.getMySQLVersion();
    }

    // ---------------------- 保存 ------------------

    /* 保存一个实体 */
    public void save(T t) {
        dao.save(t);
    }

    /* 批量保存实体 */
    public void batchSave(Collection<T> entities) {
        dao.batchSave(entities);
    }

    // ---------------------- 更新 ------------------

    /* 更新一个实体 */
    public void update(T t) {
        dao.update(t);
    }

    /* 批量更新实体 */
    public void batchUpdate(Collection<T> entities) {
        dao.batchUpdate(entities);
    }

    // ---------------------- 删除 ------------------

    /* 删除一个实体 */
    public void delete(T t) {
        dao.delete(t);
    }

    /* 批量删除实体 */
    public void batchDelete(Collection<T> entities){
        dao.batchDelete(entities);
    }

    // ---------------------- 保存/更新 ------------------

    /* 保存或更新一个实体 */
    public void saveOrUpdate(T t) { dao.saveOrUpdate(t); }

    /* 批量保存或更新 */
    public void batchSaveOrUpdate(Collection<T> entities) {
        dao.batchSaveOrUpdate(entities);
    }

    // ---------------------- 执行自定义 SQL/HQL ------------------

    /* 执行 更新/删除 HQL 语句并返回影响的行数 */
    public int executeHQL(String hql) {
        return dao.executeHQL(hql);
    }

    /* 执行 更新/删除 SQL 语句并返回影响的行数 */
    public int executeSQL(String sql) {
        return dao.executeSQL(sql);
    }

}
