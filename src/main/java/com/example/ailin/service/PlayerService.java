package com.example.ailin.service;

import java.util.List;
import java.util.Map;

public interface PlayerService {
    Map<String,Object> getIcon(Integer playerId,String season);

    List<String> getSeasonListByPlayerId(Integer playerId);

    Map<String,Object> getGrade(Integer playerId);

    boolean setGrade(String username, String grade, String playerId);

    Integer getPlayerIdByName(String playerName);
}
