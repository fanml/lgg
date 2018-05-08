package com.example.ailin.dao.impl;

import com.example.ailin.dao.TeamDao;
import com.example.ailin.entity.*;
import com.example.ailin.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.sql.Date;
import java.util.List;

@Repository
public class TeamDaoImpl implements TeamDao{
    @Autowired
    TeamRepository teamRepository;
    @Autowired
    ScheduleRepository scheduleRepository;
    @Autowired
    TeamDetailInformationRepository teamDetailInformationRepository;
    @Autowired
    SeasonSetRepository seasonSetRepository;
    @Autowired
    PlayerSetRepository playerSetRepository;
    @Autowired
    TeamHistoryRepository teamHistoryRepository;
    @Override
    public Team findOne(Integer teamId) {
        return teamRepository.findOne(teamId);
    }

    @Override
    public List<Schedule> findScheduleByTeamId(Integer teamId, Date startTime, Date endTime) {
        return scheduleRepository.findListByTeamId(teamId,startTime,endTime);
    }

    @Override
    public List<Team> findAllTeam() {
        return teamRepository.findAllTeam();
    }

    @Override
    public List<SeasonSet> findAllSeasonByTeamId(Integer teamId) {
        return seasonSetRepository.findAllSeasonByTeamId(teamId);
    }

    @Override
    public int getPlaySetByTeamIdAndSession(Integer teamId, String nowSeason) {
        return seasonSetRepository.getPlaySetByTeamIdAndSession(teamId,nowSeason);
    }

    @Override
    public String getPlaySetById(int playSetId) {
        return playerSetRepository.findPlayIdById(playSetId);
    }

    @Override
    public String getTeamNameById(Integer teamId) {
        return teamRepository.getTeamNameById(teamId);
    }

    @Override
    public List<TeamHistory> findOneTeamHistory(Integer teamId) {
        List<TeamHistory> list=teamHistoryRepository.findTeamHistoriesByTeamId(teamId);
        return list;
    }

}
