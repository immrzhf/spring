package com;

import com.user.model.User;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Login implements HandlerInterceptor {

    @Override
    public void afterCompletion(HttpServletRequest httpRequest,
                                HttpServletResponse httpResponse, Object arg2, Exception arg3)
            throws Exception {
         
    }

    @Override
    public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
            Object arg2, ModelAndView arg3) throws Exception {
        

    }

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
            Object object) throws Exception {
        String contextPath=request.getContextPath();
        HttpSession session = request.getSession();
        //判断用户是否已经登陆  依据：session中是否有用户信息
        User user = (User)session.getAttribute("userInfo");
        if(user == null){
            //没有用户信息 跳转到登陆页面
            response.sendRedirect(contextPath + "/jsp/login.jsp");
            return false;
        }
        return true;
    }

}