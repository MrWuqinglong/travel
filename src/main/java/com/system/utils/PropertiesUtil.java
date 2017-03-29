package com.system.utils;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

/**
 * 读取 Properties 文件工具类
 */
public class PropertiesUtil {

    private static Properties properties;

    private PropertiesUtil() {
    }

    // 加载属性文件进来
    static {
        InputStream is = PropertiesUtil.class.getClassLoader().getResourceAsStream("config.properties");
        properties = new Properties();
        try {
            properties.load(is);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static String getStringValue(String key) {
        return properties.getProperty(key);
    }

    public static Integer getIntegerValue(String key) {
        return Integer.parseInt(properties.getProperty(key));
    }

    public static String getStringValue(String key, String defaultValue) {
        return properties.getProperty(key, defaultValue);
    }

}
