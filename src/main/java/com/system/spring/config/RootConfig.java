package com.system.spring.config;

import com.mchange.v2.c3p0.ComboPooledDataSource;
import com.system.utils.PropertiesUtil;
import com.system.utils.SystemConstants;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import javax.sql.DataSource;
import java.beans.PropertyVetoException;
import java.util.Properties;

@Configuration
@EnableTransactionManagement
@ComponentScan({"com.service", "com.dao"})
public class RootConfig {

    /**
     * 配置数据源
     */
    @Bean
    public DataSource dataSource() throws PropertyVetoException {
        ComboPooledDataSource dataSource = new ComboPooledDataSource();
        dataSource.setJdbcUrl(PropertiesUtil.getStringValue(SystemConstants.DB_JDBC_URL));
        dataSource.setDriverClass(PropertiesUtil.getStringValue(SystemConstants.DB_DRIVER_CLASS));
        dataSource.setUser(PropertiesUtil.getStringValue(SystemConstants.DB_USER));
        dataSource.setPassword(PropertiesUtil.getStringValue(SystemConstants.DB_PASSWORD));
        dataSource.setInitialPoolSize(PropertiesUtil.getIntegerValue(SystemConstants.DB_POOL_INIT_SIZE));
        dataSource.setMinPoolSize(PropertiesUtil.getIntegerValue(SystemConstants.DB_POOL_MIN_SIZE));
        return dataSource;
    }

    /**
     * 配置 Hibernate 的 LocalSessionFactory
     */
    @Bean
    public LocalSessionFactoryBean sessionFactoryBean() throws PropertyVetoException {
        LocalSessionFactoryBean sessionFactoryBean = new LocalSessionFactoryBean();
        sessionFactoryBean.setDataSource(dataSource());
        sessionFactoryBean.setPackagesToScan("com.model");

        Properties hibernateProperties = new Properties();
        hibernateProperties.setProperty(SystemConstants.HIBERNATE_DIALECT, PropertiesUtil.getStringValue(SystemConstants.HIBERNATE_DIALECT));
        hibernateProperties.setProperty(SystemConstants.HIBERNATE_HBM2DDL_AUTO, PropertiesUtil.getStringValue(SystemConstants.HIBERNATE_HBM2DDL_AUTO));
        hibernateProperties.setProperty(SystemConstants.HIBERNATE_SHOW_SQL, PropertiesUtil.getStringValue(SystemConstants.HIBERNATE_SHOW_SQL));
        hibernateProperties.setProperty(SystemConstants.HIBERNATE_FORMAT_SQL, PropertiesUtil.getStringValue(SystemConstants.HIBERNATE_FORMAT_SQL));
        sessionFactoryBean.setHibernateProperties(hibernateProperties);
        return sessionFactoryBean;
    }

    /**
     * 配置事务管理器
     */
    @Bean
    public HibernateTransactionManager transactionManager() throws PropertyVetoException {
        HibernateTransactionManager transactionManager = new HibernateTransactionManager();
        transactionManager.setSessionFactory(sessionFactoryBean().getObject());
        return transactionManager;
    }

}
