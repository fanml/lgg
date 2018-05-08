package com.example.ailin.repository;

import com.example.ailin.entity.Team;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface TeamRepository extends CrudRepository<Team, Integer>,
        JpaSpecificationExecutor<Team> {
        @Query(value = "select t from Team t  where t.isDeleted=0")
        List<Team> findAllTeam();
        @Query(nativeQuery = true,value ="SELECT t.team_name FROM team t WHERE t.id=?1")
        String getTeamNameById(Integer teamId);
}
