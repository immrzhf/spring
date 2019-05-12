package com.spring.controller;

import com.BaseController;
import com.alibaba.fastjson.JSONObject;
import com.spring.service.TestService;
import com.user.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;


@Controller
@RequestMapping("index")
public class TestController extends BaseController {

    @Autowired
    private TestService testService;

    @RequestMapping("getUserInfo")
    public Object inIndex(){
        return null;
    }

    @RequestMapping("inLogin")
    public String inLogin(){
        System.out.println(111);
        return "login";
    }


    @RequestMapping("getGoodsList")
    @ResponseBody
    public Object getGoodsList(){
        JSONObject result = new JSONObject();
        List<Map<String,Object>> list = testService.getGoodsList();
        result.put("data",list);
        return result;
    }

}
