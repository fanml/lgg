package com.example.ailin.controller;

import com.example.ailin.entity.Users;
import com.example.ailin.service.UserService;
import com.example.ailin.tool.CaptchaUtil;
import com.example.ailin.tool.LogOperateType;
import com.example.ailin.tool.OperateLog;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.imageio.ImageIO;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@Controller
public class UsersController {
    @Autowired
    private UserService userService;

    //    跳转登录页面
    @RequestMapping(value = "/index",method = RequestMethod.GET)
    public ModelAndView index() {
        ModelAndView mv = new ModelAndView("newLogin");
        return mv;
    }

    //    登录后跳转
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(@RequestParam(value = "username") String username,
                        @RequestParam(value = "pwdMD5") String pwdMD5,
                        @RequestParam(value = "savePwd") String savePwd,
                        @RequestParam(value = "code") String code,
                        HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        session.setMaxInactiveInterval(60*60);
        String codeResult = checkCode(session, code);
        String mess = "";
        String jiaPwdMD5=convertMD5(pwdMD5);
        boolean result = userService.login(username, jiaPwdMD5);
        if (result && codeResult.equals("success")) {
            session.setAttribute("username", username);
            OperateLog.logLogin(LogOperateType.LOGIN);
            if (savePwd.equals("yes")) {
                Cookie usernameCookie = new Cookie("username", username);
                usernameCookie.setMaxAge(60 * 60 * 24 * 3);
                Cookie passwordCookie = new Cookie("password", pwdMD5);
                passwordCookie.setMaxAge(60 * 60 * 24 * 3);
                response.addCookie(usernameCookie);
                response.addCookie(passwordCookie);
            }
            return "redirect:toAllTeamGis";
        } else if (result == false && codeResult.equals("success")) {
            mess = "用户名或密码不存在，请重新登陆";
            request.setAttribute("isLogin", mess);
            return "newLogin";
        } else if (result && !codeResult.equals("success")) {
            mess = codeResult;
            request.setAttribute("isLogin", mess);
            return "newLogin";
        } else {
            mess = "用户名或密码不存在，" + codeResult + ",请重新登陆";
            request.setAttribute("isLogin", mess);
            return "newLogin";
        }
    }

    //生成验证码
    @RequestMapping("/user/check.jpg")
    public void createCode(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // 通知浏览器不要缓存
        response.setHeader("Expires", "-1");
        response.setHeader("Cache-Control", "no-cache");
        response.setHeader("Pragma", "-1");
        CaptchaUtil util = CaptchaUtil.Instance();
        // 将验证码输入到session中，用来验证
        String code = util.getString();
        request.getSession().setAttribute("code", code);
        // 输出打web页面
        ImageIO.write(util.getImage(), "jpg", response.getOutputStream());
    }

    //验证验证码是否输入正确
    private String checkCode(HttpSession session, String code) {
        String codeSession = (String) session.getAttribute("code");
        String codeResult = "";
        if (StringUtils.isEmpty(codeSession)) {
            codeResult = "没有生成验证码信息";
//            throw new IllegalStateException("ERR-01000");
        }
        if (StringUtils.isEmpty(code)) {
            codeResult = "未填写验证码信息";
//            log.error("未填写验证码信息");
//            throw new BussinessException("ERR-06018");
        }
        if (codeSession.equalsIgnoreCase(code)) {
            codeResult = "success";
            // 验证码通过
        } else {
            codeResult = "请输入正确的验证码";
//            log.error("验证码错误");
//            throw new BussinessException("ERR-06019");
        }
        return codeResult;
    }
    //跳转注册页面
    @RequestMapping(value = "toRegister",method = RequestMethod.GET)
    public String toRegister(){
        return "newRegister";
    }
    //用户注册
    @RequestMapping(value = "register", method = RequestMethod.POST)
    public String register(@RequestParam(value = "username")String username,
                           @RequestParam(value = "pwdMD5")String pwdMD5,
                           @RequestParam(value = "idCard")String idCard,
//                           @RequestParam(value = "phone_number")String tel,
                           @RequestParam(value = "email")String email
                           ) {
        String jiaPwdMD5=convertMD5(pwdMD5);
        boolean result=userService.addUser(username,jiaPwdMD5,idCard,null,null,email);
        OperateLog.logRegister(LogOperateType.REGISTER,username);
        return "redirect:toSecretQuestion?type=register&username="+username;
    }
//    加密算法
    public static String convertMD5(String inStr){

        char[] a = inStr.toCharArray();
        for (int i = 0; i < a.length; i++){
            a[i] = (char) (a[i] ^ 't');
        }
        String s = new String(a);
        return s;
    }
//  验证用户名唯一性
    @RequestMapping(value = "findByUsername",method = RequestMethod.POST)
    @ResponseBody
    public String findByUsername(String username){
        String result="true";
        List<Users>  list=userService.findByUsername(username);
        if(list.size()>0)
            result="false";
        return result;
    }
}