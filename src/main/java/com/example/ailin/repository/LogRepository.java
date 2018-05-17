package com.example.ailin.repository;

import com.example.ailin.entity.Log;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import javax.transaction.Transactional;
import java.util.List;

public interface LogRepository extends CrudRepository<Log, Integer>,
        JpaSpecificationExecutor<Log> {
    @Query(nativeQuery = true,value = "SELECT t.*  FROM log t WHERE t.is_delete=1 ORDER BY t.time")
    List<Log> findAllLog();

    @Transactional
    @Modifying(clearAutomatically = true)
    @Query(nativeQuery = true,value = "UPDATE log SET log.is_delete=0")
    void updateAll();

    @Transactional
    @Modifying(clearAutomatically = true)
    @Query(nativeQuery = true,value = "UPDATE log SET log.is_delete=0 WHERE log.id=?1")
    void update(Integer id);
}
