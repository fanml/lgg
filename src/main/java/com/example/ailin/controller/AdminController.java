package com.example.ailin.controller;

import com.alibaba.fastjson.JSONObject;
import com.example.ailin.service.LogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
     LogService logService;
    //跳转到管理员登陆
    @RequestMapping("/login")
    public String adminLogin(){
        return "adminLogin";
    }
    //登陆页面表单提交
    @RequestMapping(value = "/main",method = RequestMethod.POST)
    public  String toMain(@RequestParam(value ="adusername") String adUsers,@RequestParam(value ="adpsw") String adPwd){
        if(adUsers.equals("admin")&&adPwd.equals("dream"))
            return "adMain";
        else
            return "adError";
    }
//    ifream页面跳转
    @RequestMapping(value = "/title")
    public String title(){
        return "adTitle";
    }
//    跳转到日志显示页面
    @RequestMapping(value = "/adLog")
    public String adLog(ModelMap modelMap){
        List<Map<String,Object>> resultList=logService.getAllLog();
        modelMap.addAttribute("list", JSONObject.toJSON(resultList));
        return "adLog";

    }
//    删除日志
    @RequestMapping(value = "deleteLog")
    public String deleteLog(@RequestParam(value = "logId") String logId){
          logService.deleteLogById(logId);
          return "redirect:adLog";
    }
//    跳转用户管理页面
    @RequestMapping(value = "/adUser")
    public String adUser(ModelMap modelMap){
        List<Map<String,Object>> resultList=logService.getAllUsers();
        modelMap.addAttribute("list", JSONObject.toJSON(resultList));
        return "adUser";
    }
//    删除用户
    @RequestMapping(value = "/deleteUsers")
    public String deleteUsers(@RequestParam(value = "userId") String userId){
        logService.deleteUsersById(userId);
        return "redirect:adUser";
    }
}


