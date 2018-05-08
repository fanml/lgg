package com.example.ailin.service.impl;

import com.example.ailin.dao.SecretQuestionDao;
import com.example.ailin.dao.UsersDao;
import com.example.ailin.entity.SecretAnswer;
import com.example.ailin.entity.SecretQuestion;
import com.example.ailin.entity.Users;
import com.example.ailin.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.persistence.Column;
import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    UsersDao usersDao;
    @Autowired
    SecretQuestionDao secretQuestionDao;
    @Override
    public boolean login(String username, String pwd) {
        boolean result=false;
       List<Users> list=usersDao.login(username,pwd);
       if(list.size()>0)
           result=true;
        return result;
    }

    @Override
    public boolean addUser(String username, String psw, String idCard, String tel, String location, String email) {
          Users users=new Users(username,psw,idCard,tel,location,email);
          Users addUsers=usersDao.addUsers(users);
          boolean result=false;
          if(addUsers!=null)
              result=true;
//        usersDao.addUser(username,psw,idCard,tel,location,email);
        return result;
    }

    @Override
    public List<Users> findByUsername(String username) {
        List<Users>  list=usersDao.findByUsername(username);
        return list;
    }

    @Override
    public List<SecretQuestion> loadQuestion() {
        List<SecretQuestion> list =secretQuestionDao.loadQuestion();
        return list;
    }

    @Override
    public boolean answerValidate(String username, Integer questionId, String answer) {
        List<SecretAnswer> list=secretQuestionDao.answerValidate(username,questionId,answer);
        boolean result=false;
        if(list.size()>0)
            result=true;
        return result;
    }

    @Override
    public boolean addAnswer(String username, Integer question1, String answer1, Integer question2, String answer2, Integer question3, String answer3) {
        SecretAnswer secretAnswer1=new SecretAnswer(username,question1,answer1);
        SecretAnswer secretAnswer2=new SecretAnswer(username,question2,answer2);
        SecretAnswer secretAnswer3=new SecretAnswer(username,question3,answer3);
        SecretAnswer addSecretAnswer1=secretQuestionDao.addAnswer(secretAnswer1);
        SecretAnswer addSecretAnswer2=secretQuestionDao.addAnswer(secretAnswer2);
        SecretAnswer addSecretAnswer3=secretQuestionDao.addAnswer(secretAnswer3);
        boolean result=false;
        if(addSecretAnswer1!=null||addSecretAnswer2!=null||addSecretAnswer3!=null)
            result=true;
        return result;
    }
}
