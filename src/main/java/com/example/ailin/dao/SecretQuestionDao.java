package com.example.ailin.dao;

import com.example.ailin.entity.SecretAnswer;
import com.example.ailin.entity.SecretQuestion;

import java.util.List;

public interface SecretQuestionDao {
    List<SecretQuestion> loadQuestion();

    List<SecretAnswer> answerValidate(String username, Integer questionId, String answer);

    SecretAnswer addAnswer(SecretAnswer secretAnswer);
}
