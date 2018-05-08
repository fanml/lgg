package com.example.ailin.repository;

import com.example.ailin.entity.PlaySet;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

public interface PlayerSetRepository extends CrudRepository<PlaySet, Integer>,
        JpaSpecificationExecutor<PlaySet> {
    @Query(nativeQuery = true,value = "SELECT p.player_id FROM player_set p WHERE p.id=?1")
    String findPlayIdById(int playSetId);
}
