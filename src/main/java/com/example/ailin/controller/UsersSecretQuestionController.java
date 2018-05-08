package com.example.ailin.controller;

import com.alibaba.fastjson.JSONObject;
import com.example.ailin.entity.SecretQuestion;
import com.example.ailin.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class UsersSecretQuestionController {
    @Autowired
    UserService userService;
    //   登录页面跳转密保页面
    @RequestMapping(value = "toSecretQuestion",method = RequestMethod.GET)
    public String toSecretQuestion(@RequestParam(value = "type") String type,
                                   @RequestParam(value = "username") String username,
                                   HttpServletRequest request){
        request.setAttribute("type",type);
        request.setAttribute("username",username);
        return "secretQuestion";
    }
//    载入option密保问题
    @RequestMapping(value = "loadQuestion",method = RequestMethod.POST)
    @ResponseBody
    public String loadQuestion(){
        List<SecretQuestion> list =userService.loadQuestion();
        return JSONObject.toJSONString(list);
    }
//    验证密保问题的答案
    @RequestMapping(value = "answerValidate",method = RequestMethod.POST)
    @ResponseBody
    public String answerValidate(@RequestParam(value = "username") String username,
                                 @RequestParam(value = "questionId") Integer questionId,
                                 @RequestParam(value = "answer") String answer
                                ){
        boolean result=userService.answerValidate(username,questionId,answer);
        return JSONObject.toJSONString(result);
    }
//    注册时添加密保问题
    @RequestMapping(value = "addAnswer",method = RequestMethod.POST)
    public String addAnswer(@RequestParam(value = "username2") String username,
                            @RequestParam(value = "q1") Integer question1,
                            @RequestParam(value = "answer1") String answer1,
                            @RequestParam(value = "q2") Integer question2,
                            @RequestParam(value = "answer2") String answer2,
                            @RequestParam(value = "q3") Integer question3,
                            @RequestParam(value = "answer3") String answer3){
        boolean result=userService.addAnswer(username,question1,answer1,question2,answer2,question3,answer3);

        System.out.println(question1+" "+question2+" "+question3);
        String mess="注册失败";
        if(result){
            mess="注册成功";
            System.out.println(mess);
        }
           return "index";
    }

}
