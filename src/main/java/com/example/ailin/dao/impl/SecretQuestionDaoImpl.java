package com.example.ailin.dao.impl;

import com.example.ailin.dao.SecretQuestionDao;
import com.example.ailin.entity.SecretAnswer;
import com.example.ailin.entity.SecretQuestion;
import com.example.ailin.repository.SecretAnswerRepository;
import com.example.ailin.repository.SecretQuestionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class SecretQuestionDaoImpl  implements SecretQuestionDao{
    @Autowired
    SecretQuestionRepository secretQuestionRepository;
    @Autowired
    SecretAnswerRepository secretAnswerRepository;
    @Override
    public List<SecretQuestion> loadQuestion() {
        List<SecretQuestion> list=secretQuestionRepository.findAll();
        return list;
    }

    @Override
    public List<SecretAnswer> answerValidate(String username, Integer questionId, String answer) {
        List<SecretAnswer> list=secretAnswerRepository.findByUserNameAndQuestionIdAndAnswer(username,questionId,answer);
        return list;
    }

    @Override
    public SecretAnswer addAnswer(SecretAnswer secretAnswer) {
        SecretAnswer addSecretAnswer=secretAnswerRepository.save(secretAnswer);
        return addSecretAnswer;
    }

}
