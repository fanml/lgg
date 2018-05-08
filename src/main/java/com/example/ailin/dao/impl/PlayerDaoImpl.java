package com.example.ailin.dao.impl;

import com.example.ailin.dao.PlayerDao;
import com.example.ailin.entity.Injury;
import com.example.ailin.entity.Player;
import com.example.ailin.entity.PlayerSeasonDetail;
import com.example.ailin.entity.PlayerUserReview;
import com.example.ailin.entity.resultSet.ITeam;
import com.example.ailin.repository.InjuryRepository;
import com.example.ailin.repository.PlayerRepository;
import com.example.ailin.repository.PlayerSeasonDetailRepository;
import com.example.ailin.repository.PlayerUserReviewRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.util.StringUtils;

import java.util.List;
import java.util.Map;

@Repository
public class PlayerDaoImpl implements PlayerDao {
    @Autowired
    PlayerRepository playerRepository;
    @Autowired
    PlayerSeasonDetailRepository playerSeasonDetailRepository;
    @Autowired
    InjuryRepository injuryRepository;
    @Autowired
    PlayerUserReviewRepository playerUserReviewRepository;
    @Override
    public Player getByPlayerId(int playId) {
        return playerRepository.findById(playId);
    }

    @Override
    public List<PlayerSeasonDetail> getAllPlayerSeasonDetailByPlayerId(int playId) {
        return playerSeasonDetailRepository.findAllByPlayerIdOrderBySeason(playId);
    }

    @Override
    public List<Integer> getTeamWorkNum(Integer playerId) {
        return playerSeasonDetailRepository.getTeamWorkNum( playerId);
    }

    @Override
    public String getPlayerImgBySeason(String season,int playerId) {
        return playerSeasonDetailRepository.getPlayerImgBySeason(season,playerId);
    }

    @Override
    public List<String> getSeasonListByPlayerId(Integer playerId) {
        return playerSeasonDetailRepository.getSeasonListByPlayerId(playerId);
    }

    @Override
    public List<java.math.BigInteger> getNumByPlayerId(Integer playerId) {
        return playerSeasonDetailRepository.getNumByPlayerId(playerId);
    }

    @Override
    public Injury getInjuryById(Integer b) {
        return injuryRepository.findAllById(b);
    }

    @Override
    public boolean setGrade(String username, int grade, int playerId) {
        boolean b=false;
        PlayerUserReview playerUserReview=new PlayerUserReview(username,grade,playerId);
        PlayerUserReview pur=playerUserReviewRepository.save(playerUserReview);
        if(!StringUtils.isEmpty(pur))
            b=true;
        return b;
    }

    @Override
    public double getGradeAvg(Integer playerId) {
        java.math.BigDecimal b=playerUserReviewRepository.getGradeAvg(playerId);
        double a= 0;
        if(b!=null){
             a=b.doubleValue();
        }
        return a;
    }

    @Override
    public Integer getPlayerIdByName(String playerName) {
        String name1="%"+playerName+"%";
        String name2="%"+playerName;
        List<Integer> list=playerRepository.getPlayerIdByName(name1,name2);
        Integer a=0;
        if(list.size()>0){
            a=list.get(0);
        }
        return a;
    }

}
