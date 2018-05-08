package com.example.ailin.dao;

import com.example.ailin.entity.*;

import java.sql.Date;
import java.util.List;

public interface TeamDao {
    Team findOne(Integer teamId);

    List<Schedule> findScheduleByTeamId(Integer teamId, Date startTime, Date endTime);

    List<Team> findAllTeam();


    List<SeasonSet> findAllSeasonByTeamId(Integer teamId);

    int getPlaySetByTeamIdAndSession(Integer teamId, String nowSeason);

    String getPlaySetById(int playSetId);

    String getTeamNameById(Integer teamId);

    List<TeamHistory> findOneTeamHistory(Integer teamId);
}
