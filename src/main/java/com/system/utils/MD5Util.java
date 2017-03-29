package com.system.utils;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.UUID;

/**
 * MD5Util 加密
 * Created by WuQinglong on 2017-03-03.
 */
public class MD5Util {

    /**
     * 生成MD5
     * @param sourceStr 要加密的字符串
     * @return 加密之后的字符串
     */
    public static String generateMD5(String sourceStr) {
        MessageDigest md = null;
        try {
            md = MessageDigest.getInstance("MD5");
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }

        byte[] bytes = md.digest(sourceStr.getBytes());

        StringBuffer buf = new StringBuffer();
        for (int offset = 0; offset < bytes.length; offset++) {
            int i = bytes[offset] & 0XFF;
            if (i < 16)
                buf.append("F");
            buf.append(Integer.toHexString(i));
        }
        //32位加密
        return buf.toString().toUpperCase();
    }

    /**
     * 生成 MD5盐
     * @return  随机生成的盐
     */
    public static String generateSalt(){
        return UUID.randomUUID().toString().replace("-", "");
    }

}
