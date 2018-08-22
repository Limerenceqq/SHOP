package com.shop.model;

import java.util.Date;
import java.util.List;

/**
 *@author asus11
 *@create 2018/7/28 10:21
 *@desc  分页显示数据类 PageBean
 **/
public class PageBean<T> {
    private String productName;
    /**
     * 所要查询订单的oid
     */
    private int oid;
    /**
     * 所要查询订单的收件人姓名
     */
    private String username;
    /**
     * 所要查询订单的状态
     */
    private int state;
    /**
     * 所要查询订单的开始时间
     */
    private Date startTime;
    /**
     * 所要查询订单的结束时间
     */
    private Date endTime;
    /**
     * 所要查询的一级类目id
     */
    private int cid;

    /**
     * 所要查询的二级类目id
     */
    private int csid;
    /**
     * 当前页数
     */
    private Integer pageNow;
    /**
     * 显示的起始记录
     */
    private int begin;
    /**
     * 每页显示记录数
     */
    private Integer limit;
    /**
     * 总记录数
     */
    private Integer totalCount;
    /**
     * 总页数
     */
    private Integer totalPage;

    /**
     * 显示到浏览器的数据
     */
    private List<T> list;

    public Integer getPageNow() {
        return pageNow;
    }

    public void setPageNow(Integer pageNow) {
        this.pageNow = pageNow;
    }

    public Integer getLimit() {
        return limit;
    }

    public void setLimit(Integer limit) {
        this.limit = limit;
    }

    public Integer getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(Integer totalCount) {
        this.totalCount = totalCount;
    }

    public Integer getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(Integer totalPage) {
        this.totalPage = totalPage;
    }

    public List<T> getList() {
        return list;
    }

    public void setList(List<T> list) {
        this.list = list;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public int getCsid() {
        return csid;
    }

    public void setCsid(int csid) {
        this.csid = csid;
    }

    public int getBegin() {
        return begin;
    }

    public void setBegin(int begin) {
        this.begin = begin;
    }

    public int getOid() {
        return oid;
    }

    public void setOid(int oid) {
        this.oid = oid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    @Override
    public String toString() {
        return "PageBean{" +
                "productName='" + productName + '\'' +
                ", oid=" + oid +
                ", username='" + username + '\'' +
                ", state=" + state +
                ", startTime=" + startTime +
                ", endTime=" + endTime +
                ", cid=" + cid +
                ", csid=" + csid +
                ", pageNow=" + pageNow +
                ", begin=" + begin +
                ", limit=" + limit +
                ", totalCount=" + totalCount +
                ", totalPage=" + totalPage +
                ", list=" + list +
                '}';
    }
}
