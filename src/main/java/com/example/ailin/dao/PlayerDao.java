package com.example.ailin.dao;

import com.example.ailin.entity.Injury;
import com.example.ailin.entity.Player;
import com.example.ailin.entity.PlayerSeasonDetail;
import com.example.ailin.entity.resultSet.ITeam;

import java.util.List;
import java.util.Map;

public interface PlayerDao {
    Player getByPlayerId(int playId);
    List<PlayerSeasonDetail>  getAllPlayerSeasonDetailByPlayerId(int playId);

    List<Integer> getTeamWorkNum(Integer playerId);

    String getPlayerImgBySeason(String season,int playerId);

    List<String> getSeasonListByPlayerId(Integer playerId);

    List<java.math.BigInteger> getNumByPlayerId(Integer playerId);

    Injury getInjuryById(Integer b);

    boolean setGrade(String username, int grade, int playerId);

    double getGradeAvg(Integer playerId);

    Integer getPlayerIdByName(String playerName);
}
