package com.example.ailin.service;


import com.example.ailin.entity.SecretQuestion;
import com.example.ailin.entity.Users;

import java.util.List;

public interface UserService {
    boolean login(String username,String pwd);
    boolean addUser(String username, String psw, String idCard, String tel, String location, String email);

    List<Users> findByUsername(String username);

    List<SecretQuestion> loadQuestion();

    boolean answerValidate(String username, Integer questionId, String answer);

    boolean addAnswer(String username, Integer question1, String answer1, Integer question2, String answer2, Integer question3, String answer3);
}
