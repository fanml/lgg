package com.example.ailin.repository;

import com.example.ailin.entity.Log;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.CrudRepository;

public interface LogRepository extends CrudRepository<Log, Integer>,
        JpaSpecificationExecutor<Log> {
}
