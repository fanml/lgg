package com.example.ailin.service;

import java.util.List;
import java.util.Map;

public interface TeamService {
    List<Map<String,Double>> getTeamScheduleByTeamId(Integer teamId,String startTime,String endTime);

    List<Map<String,Object>> findAllTeam();

    Map<String,List<Map<String,Object>>> getTeamAllDetailInformation(Integer teamId,String season);

    Map<String,Object> getTeamById(Integer teamId);

    List<Map<String,Object>> getTeamHistoryById(Integer teamId);
}
