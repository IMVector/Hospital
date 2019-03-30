package com.vector.dao.impl;

import com.vector.dao.BaseDao;
import static com.vector.utils.CommonUtils.EVERY_PAGE_NUMBER;
import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

public class BaseDaoImpl<T> implements BaseDao<T> {

    private Class<T> clazz;

    @Autowired
    private SessionFactory sessionFactory;

    public BaseDaoImpl() {
        ParameterizedType type = (ParameterizedType) this.getClass().getGenericSuperclass();
        clazz = (Class<T>) type.getActualTypeArguments()[0];
    }

    @Override
    public void insert(T t) {
        sessionFactory.getCurrentSession().save(t);
    }

    @Override
    public void update(T t) {
        sessionFactory.getCurrentSession().update(t);
    }

    @Override
    public void delete(Serializable id) {
        T t = getOneById(id);
        sessionFactory.getCurrentSession().delete(t);
    }

    @Override
    public T getOneById(Serializable id) {
        return (T) sessionFactory.getCurrentSession().get(clazz, id);
    }

    @Override
    public List<T> getListByQuery(String hql, Object... params) {
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        for (int i = 0; i < params.length; i++) //遍历参数数组,设置查询参数值
        {
            query.setParameter(i, params[i]);
        }
        return query.list(); //执行查询,返回结果列表
    }

    /**
     * 查询列表中的总数量
     *
     * @param hql
     * @param params
     * @return 列表项的数量
     */
    @Override
    public int getListSize(String hql, Object... params) {
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        for (int i = 0; i < params.length; i++) {
            query.setParameter(i, params[i]);
        }
        Long size = (Long) query.uniqueResult();
        return size.intValue();
    }

    /**
     * 分页查询
     *
     * @param hql
     * @param currentPage
     * @param params
     * @return
     */
    @Override
    public List<T> getListPaginationByQuery(String hql, Serializable currentPage, Object... params) {
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        for (int i = 0; i < params.length; i++) {
            query.setParameter(i, params[i]);
        }
        query.setFirstResult(((int) currentPage - 1) * EVERY_PAGE_NUMBER);
        query.setMaxResults(EVERY_PAGE_NUMBER);
        return query.list(); //执行查询,返回结果列表
    }

    @Override
    public int batchDML(String hql, Object... params) {
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        for (int i = 0; i < params.length; i++) {
            query.setParameter(i, params[i]);
        }
        return query.executeUpdate();
    }

}
