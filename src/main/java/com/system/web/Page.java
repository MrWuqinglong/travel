package com.system.web;


import com.system.utils.PropertiesUtil;
import com.system.utils.WebConstants;

import java.util.List;

/**
 * 分页类
 */
public class Page<T> {

    private Integer totalItem;
    private Integer totalPage;
    private Integer pageNo;
    private Integer pageSize = 5;
    private List<T> list;

    public Page() {
        pageSize = PropertiesUtil.getIntegerValue(WebConstants.PAGE_SIZE);
    }

    public Page(Integer pageNo) {
        this.pageNo = pageNo;
        pageSize = PropertiesUtil.getIntegerValue(WebConstants.PAGE_SIZE);
    }

    /**
     * 设置总的记录数, 接着设置总页数
     *
     * @param totalItem 总记录数
     */
    public void setTotalItem(Integer totalItem) {
        this.totalItem = totalItem;
    }

    public Integer getTotalPage() {
        if (totalItem == 0) {
            totalPage = 0;
        } else {
            if (totalItem % pageSize == 0) {
                totalPage = totalItem / pageSize;
            } else {
                totalPage = totalItem / pageSize + 1;
            }
        }
        return totalPage;
    }

    public List<T> getList() {
        return list;
    }

    public void setList(List<T> list) {
        this.list = list;
    }

    public Integer getPageNo() {
        if (pageNo < 1) {
            pageNo = 1;
        } else if (pageNo > getTotalPage()) {
            pageNo = getTotalPage();
        }
        return pageNo;
    }

    public void setPageNo(Integer pageNo) {
        this.pageNo = pageNo;
    }

    public Integer getPageSize() {
        return pageSize;
    }
}
