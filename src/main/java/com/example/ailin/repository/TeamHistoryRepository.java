package com.example.ailin.repository;

import com.example.ailin.entity.TeamHistory;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface TeamHistoryRepository extends CrudRepository<TeamHistory, Integer>,
        JpaSpecificationExecutor<TeamHistory> {
    @Query(nativeQuery = true,value = "SELECT t.* FROM team_history t WHERE t.team_id=?1 ORDER BY t.interval")
    List<TeamHistory>  findTeamHistoriesByTeamId(Integer teamId);
}
