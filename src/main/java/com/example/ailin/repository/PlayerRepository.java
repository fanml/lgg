package com.example.ailin.repository;

import com.example.ailin.entity.Player;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface PlayerRepository extends CrudRepository<Player, Integer>,
        JpaSpecificationExecutor<Player> {
    @Query(nativeQuery = true,value = "SELECT p.* FROM  player p WHERE  p.id=?1")
    Player findById(Integer id);

    @Query(nativeQuery = true,value = "SELECT p.id FROM player p WHERE p.name LIKE ?1 OR p.english_name LIKE ?2")
    List<Integer> getPlayerIdByName(String name1,String name2);
}
