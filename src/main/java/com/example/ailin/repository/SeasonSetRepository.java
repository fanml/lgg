package com.example.ailin.repository;

import com.example.ailin.entity.SeasonSet;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface SeasonSetRepository extends CrudRepository<SeasonSet, Integer>,
        JpaSpecificationExecutor<SeasonSet> {
    @Query(nativeQuery = true,value = "SELECT ss.* FROM dream.season_set ss INNER JOIN team_detail_information tdi on ss.season_set_id=tdi.season_set_id INNER  JOIN team t on tdi.detail_id=t.detail_id WHERE t.id=?1 AND ss.champion=1 ORDER BY ss.season")
    List<SeasonSet> findAllSeasonByTeamId(Integer teamId);

    @Query(nativeQuery = true,value = "SELECT ss.player_set_id  FROM dream.season_set ss INNER JOIN team_detail_information tdi on ss.season_set_id=tdi.season_set_id INNER  JOIN team t on tdi.id=t.detail_id WHERE tdi.detail_id=?1 and ss.season LIKE ?2")
    int getPlaySetByTeamIdAndSession(Integer teamId, String nowSeason);
}
