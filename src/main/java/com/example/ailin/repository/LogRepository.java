package com.example.ailin.repository;

import com.example.ailin.entity.Log;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface LogRepository extends CrudRepository<Log, Integer>,
        JpaSpecificationExecutor<Log> {
    @Query(nativeQuery = true,value = "SELECT t.*  FROM log t ORDER BY t.time")
    List<Log> findAllLog();
}
