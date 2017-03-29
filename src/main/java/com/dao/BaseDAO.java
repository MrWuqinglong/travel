package com.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.lang.reflect.ParameterizedType;
import java.util.Collection;
import java.util.List;

@Repository
public abstract class BaseDAO<T> {

    private Class<T> clazz;
    private SessionFactory sessionFactory;

    public BaseDAO() {
        ParameterizedType type = (ParameterizedType) this.getClass().getGenericSuperclass();
        clazz = (Class<T>) type.getActualTypeArguments()[0];
    }

    @Resource
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    private Session getSession() {
        return sessionFactory.getCurrentSession();
    }

    // ---------------------- 查询 ------------------

    /* 获取一个实体 */
    public T get(Integer id) {
        return getSession().get(clazz, id);
    }

    /* 根据条件获取一个实体 */
    public T get(String hql, Object... params) {
        Query query = getSession().createQuery(hql);
        for (int i = 0; i < params.length; ++i) {
            query.setParameter(i, params[i]);
        }
        return (T) query.uniqueResult();
    }

    /* 分页获取集合 */
    public List<T> listPage(String hql, Integer pageNo, Integer pageSize) {
        Query query = getSession().createQuery(hql);
        query.setFirstResult((pageNo-1) * pageSize);
        query.setMaxResults(pageSize);
        return query.list();
    }

    /* 条件分页获取集合 */
    public List<T> listPageWithCondition(String hql, Integer pageNo, Integer pageSize, Object... params) {
        Query query = getSession().createQuery(hql);
        for (int i = 0; i < params.length; ++i) {
            query.setParameter(i, params[i]);
        }
        query.setFirstResult((pageNo-1) * pageSize);
        query.setMaxResults(pageSize);
        return query.list();
    }

    /* 自定义 HQL 查询一个集合 */
    public List<T> listWithCustom(String hql, Object... params) {
        Query query = getSession().createQuery(hql);
        for (int i = 0; i < params.length; ++i) {
            query.setParameter(i, params[i]);
        }
        return query.list();
    }

    /* 根据条件统计数量 */
    public Integer countAll() {
        Query query = getSession().createQuery("SELECT COUNT(*) FROM " + clazz.getSimpleName());
        Object result = query.uniqueResult();
        return Integer.parseInt(String.valueOf(result));
    }

    /* 根据条件统计数量 */
    public Integer countWithCondition(String hql, Object... params) {
        Query query = getSession().createQuery(hql);
        for (int i = 0; i < params.length; ++i) {
            query.setParameter(i, params[i]);
        }
        Object result = query.uniqueResult();
        return Integer.parseInt(String.valueOf(result));
    }

    /* 获取所有 */
    public List<T> listAll() {
        Query query = getSession().createQuery("FROM " + clazz.getSimpleName());
        return query.list();
    }

    /* 获取 MySQL 的版本号 */
    public Object getMySQLVersion() {
        String sql = "SELECT VERSION()";
        return getSession().createNativeQuery(sql).getSingleResult();
    }

    // ---------------------- 保存 ------------------

    /* 保存一个实体 */
    public void save(T t) {
        getSession().save(t);
    }

    /* 批量保存实体 */
    public void batchSave(Collection<T> entities) {
        for (T t : entities)
            getSession().save(t);
    }

    // ---------------------- 更新 ------------------

    /* 更新一个实体 */
    public void update(T t) {
        getSession().update(t);
    }

    /* 批量更新实体 */
    public void batchUpdate(Collection<T> entities) {
        for (T t: entities)
            getSession().update(t);
    }

    // ---------------------- 删除 ------------------

    /* 删除一个实体 */
    public void delete(T t) {
        getSession().delete(t);
    }

    /* 批量删除实体 */
    public void batchDelete(Collection<T> entities){
        for (T t : entities)
            getSession().delete(t);
    }

    // ---------------------- 保存/更新 ------------------

    /* 保存或更新一个实体 */
    public void saveOrUpdate(T t) { getSession().saveOrUpdate(t); }

    /* 批量保存或更新 */
    public void batchSaveOrUpdate(Collection<T> entities) {
        for (T t : entities)
            getSession().saveOrUpdate(t);
    }

    // ---------------------- 执行自定义 SQL/HQL ------------------

    /* 执行 更新/删除 HQL 语句并返回影响的行数 */
    public int executeHQL(String hql) {
        return getSession().createQuery(hql).executeUpdate();
    }

    /* 执行 更新/删除 SQL 语句并返回影响的行数 */
    public int executeSQL(String sql) {
        return getSession().createNativeQuery(sql).executeUpdate();
    }

}
