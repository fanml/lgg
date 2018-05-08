package com.example.ailin.repository;

import com.example.ailin.entity.PlayerSeasonDetail;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface PlayerSeasonDetailRepository extends CrudRepository<PlayerSeasonDetail, Integer>,
        JpaSpecificationExecutor<PlayerSeasonDetail> {
//    @Query(nativeQuery = true,value = "SELECT a.* FROM player_season_detail a WHERE a.player_id=?1")
    List<PlayerSeasonDetail> findAllByPlayerIdOrderBySeason(Integer playerId);

//    @Query("SELECT new ITeam(count(t),t.team_id) FROM player_season_detail t WHERE t.player_id=?1 GROUP BY t.team_id ")
//    @Query("SELECT new ITeam(count(t),t.teamId) FROM PlayerSeasonDetail t WHERE t.playerId=?1 GROUP BY t.teamId")
    @Query(nativeQuery = true,value = "SELECT t.team_id FROM player_season_detail t WHERE t.player_id=?1 GROUP BY t.team_id ORDER BY t.team_id")
     List<Integer> getTeamWorkNum(Integer playerId);

    @Query(nativeQuery = true,value = "SELECT COUNT(*)FROM player_season_detail t  WHERE t.player_id=?1 GROUP BY t.team_id ORDER BY t.team_id")
    List<java.math.BigInteger> getNumByPlayerId(Integer playerId);

    @Query(nativeQuery = true,value = "SELECT t.img FROM player_season_detail t WHERE t.season LIKE ?1 AND t.player_id=?2")
    String getPlayerImgBySeason(String season,int playerId);

    @Query(nativeQuery = true,value = "SELECT t.season FROM player_season_detail t WHERE t.player_id=?1 ORDER BY t.season")
    List<String> getSeasonListByPlayerId(Integer playerId);

}
