package com.user.controller;

import com.BaseController;
import com.alibaba.fastjson.JSONObject;
import com.user.model.User;
import com.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;


@Controller
@RequestMapping("user")
public class UserController extends BaseController {

    @Autowired
    private UserService userService;

    private String account;
    private String password;

    @RequestMapping("doRegister")
    @ResponseBody
    public Object doRegister(){
        JSONObject result = new JSONObject();
        result.put("success",true);
        try{
            Map<String,Object> param = new HashMap<String, Object>();
            param.put("name",getRequest().getParameter("name"));
            param.put("role",getRequest().getParameter("role"));
            param.put("account",getRequest().getParameter("account"));
            param.put("password",getRequest().getParameter("password"));
            User user = userService.getUserInfoByAccount(param);
            if(user != null){
                result.put("success",false);
                result.put("message","账号已存在！");
            }else{
                user = new User();
                user.setUser_name(getRequest().getParameter("name"));
                user.setUser_account(getRequest().getParameter("account"));
                user.setUser_password(getRequest().getParameter("password"));
                user.setUser_role(getRequest().getParameter("role"));
                userService.addUserInfo(user);
                if(user.getUser_role().equals("student")){
                    userService.addUserXueji(user);
                }
                result.put("message","添加成功！");
            }
        }catch (Exception e){
            e.printStackTrace();
            result.put("success",false);
            result.put("message","注册失败！");
        }
        return result;
    }

    @RequestMapping("doLogin")
    @ResponseBody
    public Object doLogin(){
        JSONObject result = new JSONObject();
        result.put("success",true);
        try{
            Map<String,Object> param = new HashMap<String, Object>();
            param.put("account",getRequest().getParameter("account"));
            param.put("password",getRequest().getParameter("password"));
            User user = userService.getUserAccountAndPassword(param);
            if(user != null){
                HttpSession session = getRequest().getSession();
                session.setAttribute("userInfo",user);
            }
            result.put("data",user);
        }catch (Exception e){
            e.printStackTrace();
            result.put("success",false);
        }
        return result;
    }

    @RequestMapping("getUserXuejiById")
    @ResponseBody
    public Object getUserXuejiById(){
        JSONObject result = new JSONObject();
        result.put("success",true);
        try{
            Map<String,Object> param = new HashMap<String, Object>();
            param.put("id",getRequest().getParameter("id"));
            Map<String,Object> userMap = userService.getUserXuejiById(param);
            result.put("data",userMap);
        }catch (Exception e){
            e.printStackTrace();
            result.put("success",false);
        }
        return result;
    }



    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
