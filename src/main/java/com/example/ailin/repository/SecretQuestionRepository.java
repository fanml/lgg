package com.example.ailin.repository;

import com.example.ailin.entity.SecretQuestion;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface SecretQuestionRepository extends CrudRepository<SecretQuestion, Integer>,
        JpaSpecificationExecutor<SecretQuestion> {

        List<SecretQuestion> findAll();
}
