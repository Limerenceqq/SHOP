package com.shop.model;


/**
*@author asus11
*@create 2018/7/30 15:04
*@desc 用户信息实体类
**/
public class User {
    /**
     * 用户id
     */
    private int uid;
    /**
     * 用户名
     */
    private String username;
    /**
     * 用户密码
     */
    private String password;
    /**
     * 真实姓名
     */
    private String name;
    /**
     * 邮箱
     */
    private String email;
    /**
     * 电话
     */
    private String phone;
    /**
     * 住址
     */
    private String addr;
    /**
     * 状态
     */
    private int state;
    /**
     * 编号
     */
    private String code;


    /**
    *@author asus11
    *@create 2018/7/30 15:01
    *@desc 无参构造器
    **/
    public User(){
        super();
    }
    /**
    *@author asus11
    *@create 2018/7/30 15:06
    *@desc 带参构造器
    **/
    public User(int uid, String username, String password, String email, String name, String phone, String addr,
                int state, String code) {
        super();
        this.uid = uid;
        this.username = username;
        this.password = password;
        this.email = email;
        this.name = name;
        this.phone = phone;
        this.addr = addr;
        this.state = state;
        this.code = code;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddr() {
        return addr;
    }

    public void setAddr(String addr) {
        this.addr = addr;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    @Override
    public String toString() {
        return "User{" +
                "uid=" + uid +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", name='" + name + '\'' +
                ", email='" + email + '\'' +
                ", phone='" + phone + '\'' +
                ", addr='" + addr + '\'' +
                ", state=" + state +
                ", code='" + code + '\'' +
                '}';
    }
}
