package com.example.ailin.repository;

import com.example.ailin.entity.SecretAnswer;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface SecretAnswerRepository extends CrudRepository<SecretAnswer, Integer>,
        JpaSpecificationExecutor<SecretAnswer> {
    List<SecretAnswer> findByUserNameAndQuestionIdAndAnswer(String username, Integer questionId, String answer);
}
