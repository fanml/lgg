package com.example.ailin.service.impl;

import com.example.ailin.dao.PlayerDao;
import com.example.ailin.dao.TeamDao;
import com.example.ailin.entity.Injury;
import com.example.ailin.entity.Player;
import com.example.ailin.entity.PlayerSeasonDetail;
import com.example.ailin.entity.PlayerUserReview;
import com.example.ailin.entity.resultSet.ITeam;
import com.example.ailin.service.PlayerService;
import org.apache.catalina.servlet4preview.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.*;

@Service
public class PlayerServiceImpl implements PlayerService {

    @Autowired
    PlayerDao playerDao;
    @Autowired
    TeamDao teamDao;
    public Map<String,Object> getIcon(Integer playerId,String season) {
//        折线图
      List<PlayerSeasonDetail> playerSeasonDetails= playerDao.getAllPlayerSeasonDetailByPlayerId(playerId);
      Map<String,Object> resultMap=new HashMap<>();
      List<String> seasonList=new ArrayList<>();
      List<Object> salaryList=new ArrayList<>();
      List<Object> accountList=new ArrayList<>();
      for(PlayerSeasonDetail psd:playerSeasonDetails){
          seasonList.add(psd.getSeason());
          salaryList.add(psd.getSalary());
          accountList.add(psd.getAccount());
      }
        Player player=playerDao.getByPlayerId(playerId);
        seasonList.add(0,"0");
        salaryList.add(0,"0");
        accountList.add(0,"0");
//        饼图List<List<List>>>
        List<Integer> teamWorkNums=playerDao.getTeamWorkNum(playerId);
        List<java.math.BigInteger> nums=playerDao.getNumByPlayerId(playerId);
        List<Map<String,Object>> cakeList=new ArrayList<>();
        for(int i=0;i<nums.size();i++){
            Map<String,Object> map=new HashMap<>();
            map.put("value",nums.get(i));
            map.put("name",teamDao.getTeamNameById(teamWorkNums.get(i)));
            cakeList.add(map);
        }
//        获取球员当前赛季图片
        String playerImg=getPlayerImg(playerId,season);
//        获取球员伤病情况
        List<String> injuryList=new ArrayList<>();
        List<String> injurySeasonList=new ArrayList<>();
        for(PlayerSeasonDetail psd:playerSeasonDetails){
            String injury=psd.getInjury();
            String [] injuryBodys=injury.split(",");
            for(int i=0;i<injuryBodys.length;i++){
                injurySeasonList.add(psd.getSeason());
            }
            Collections.addAll(injuryList,injuryBodys);
        }

        List<String> bodyPartsList=new ArrayList<>();
        for(String a:injuryList){
            Integer b=Integer.parseInt(a);
            Injury injury=playerDao.getInjuryById(b);
            String bodyParts=injury.getBodyParts();
            bodyPartsList.add(bodyParts);
        }


        resultMap.put("playerId",playerId);
        resultMap.put("playerImg",playerImg);
        resultMap.put("playerName",player.getName());
        resultMap.put("seasonList",seasonList);
        resultMap.put("salaryList",salaryList);
        resultMap.put("accountList",accountList);
        resultMap.put("cakeList",cakeList);
        resultMap.put("bodyPartsList",bodyPartsList);
        resultMap.put("injurySeasonList",injurySeasonList);
        return resultMap;
    }

//    加载球员进入NBA赛季的下拉框
    @Override
    public List<String> getSeasonListByPlayerId(Integer playerId) {
        List<String> resultList=playerDao.getSeasonListByPlayerId(playerId);
        return resultList;
    }

    @Override
    public Map<String,Object> getGrade(Integer playerId) {
        List<PlayerSeasonDetail> playerSeasonDetails= playerDao.getAllPlayerSeasonDetailByPlayerId(playerId);
        int seasonCount=playerSeasonDetails.size();
        double salaryNum=0;
        double accountNum=0;
        double timeNum=0;
        double hitRateNum=0;
        double blockShotNum=0;
        double fireNum=0;
        List<String> injuryList=new LinkedList<>();
        int i=0;//伤病参数
        for(PlayerSeasonDetail psd:playerSeasonDetails) {
            salaryNum = salaryNum + psd.getSalary().doubleValue();
            accountNum = accountNum + psd.getAccount();
            timeNum=timeNum+psd.getTime();
            hitRateNum=hitRateNum+psd.getHitRate();
            blockShotNum=blockShotNum+psd.getBlockShot();
            fireNum=fireNum+psd.getFire();
            String injury=psd.getInjury();
            String [] injuryBodys=injury.split(",");
            if(injuryBodys.length>1)
                i++;
            Collections.addAll(injuryList,injuryBodys);
        }
        double salaryAvg=salaryNum/seasonCount;//平均工资
        double accountAvg=accountNum/seasonCount;//平均得分
        double timeAvg=timeNum/seasonCount;//平均上场时间
        double hitRateAvg=hitRateNum/seasonCount;//平均命中率
        double blockShotAvg=blockShotNum/seasonCount;//平均盖帽
        double fireAvg=fireNum/seasonCount;//平均出手次数

//        计算忠诚度
        List<java.math.BigInteger> nums=playerDao.getNumByPlayerId(playerId);
        int loyalty=0;
        for(java.math.BigInteger b:nums){
            int a=b.intValue();
           if(a>=3&&a<5){
               loyalty+=50;
           }else if(a>=5){
               loyalty+=80;
           }else{
               loyalty+=0;
           }
        }
        loyalty=loyalty-(nums.size()-1)*10;
        if(loyalty>100)
            loyalty=100;
        if(loyalty<0)
            loyalty=0;
//       伤病程度计算
        int injuryLevel =(injuryList.size()+i)*10;
        //        获得球员综合评分


        double endGrade=0;
        if((accountAvg+blockShotAvg)>0){
             endGrade=(salaryAvg*fireAvg*hitRateAvg/(accountAvg+blockShotAvg)-(injuryLevel-loyalty)/10)/1000;
        }

        Map<String,Object> resultMap=new HashMap<>();
        resultMap.put("endGrade",endGrade);
        List<Object> resultList=new LinkedList<>();
        List<Object> titleList=new LinkedList<>();
        titleList.add("score");
        titleList.add("amount");
        titleList.add("product");
        resultList.add(titleList);

        List<Object> injuryLevelList=new LinkedList<>();
        injuryLevelList.add(injuryLevel);
        injuryLevelList.add(injuryLevel);
        injuryLevelList.add("伤病程度");
        resultList.add(injuryLevelList);

        List<Object> loyaltyList=new LinkedList<>();
        loyaltyList.add(loyalty);
        loyaltyList.add(loyalty);
        loyaltyList.add("忠诚度");
        resultList.add(loyaltyList);

        List<Object> salaryAvgList=new LinkedList<>();
        salaryAvgList.add(salaryAvg/100);
        salaryAvgList.add(salaryAvg/100);
        salaryAvgList.add("平均工资");
        resultList.add(salaryAvgList);

        List<Object> accountAvgList=new LinkedList<>();
        accountAvgList.add(accountAvg);
        accountAvgList.add(accountAvg);
        accountAvgList.add("平均得分");
        resultList.add(accountAvgList);

        List<Object> timeAvgList=new LinkedList<>();
        timeAvgList.add(timeAvg);
        timeAvgList.add(timeAvg);
        timeAvgList.add("平均上场时间");
        resultList.add(timeAvgList);

        List<Object> hitRateAvgList=new LinkedList<>();
        hitRateAvgList.add(hitRateAvg);
        hitRateAvgList.add(hitRateAvg);
        hitRateAvgList.add("平均命中率");
        resultList.add(hitRateAvgList);

        List<Object> blockShotAvgList=new LinkedList<>();
        blockShotAvgList.add(blockShotAvg);
        blockShotAvgList.add(blockShotAvg);
        blockShotAvgList.add("平均盖帽");
        resultList.add(blockShotAvgList);

        List<Object> fireAvgList=new LinkedList<>();
        fireAvgList.add(fireAvg);
        fireAvgList.add(fireAvg);
        fireAvgList.add("平均出手次数");
        resultList.add(fireAvgList);

//        获得用户评价
        double playerUserGradeAvg=playerDao.getGradeAvg(playerId);
        List<Object> playerUserGradeList=new LinkedList<>();
        playerUserGradeList.add(playerUserGradeAvg*20);
        playerUserGradeList.add(playerUserGradeAvg*20);
        playerUserGradeList.add("商业价值");
        resultList.add(playerUserGradeList);
        resultMap.put("list",resultList);

        return resultMap;
    }

    @Override
    public boolean setGrade(String username, String grade, String playerId) {
        int igrade=Integer.parseInt(grade);
        int iplayerId=Integer.parseInt(playerId);
        boolean b=playerDao.setGrade(username,igrade,iplayerId);
        System.out.println(username+" "+igrade+" "+iplayerId);
        System.out.println(b);
        return b;
    }

    @Override
    public Integer getPlayerIdByName(String playerName) {
        Integer playerId=playerDao.getPlayerIdByName(playerName);
        return playerId;
    }

    //    获取球员当前赛季图片方法
    private String getPlayerImg(int playerId,String season){
//        Calendar calendar=Calendar.getInstance();
//        int year=calendar.get(Calendar.YEAR);
//        int month=calendar.get(Calendar.MONTH)+1;
//        if(month>9){
//            year=year+1;
//        }
//        String nowSeason="%-"+year+"%";
        String playerImg=playerDao.getPlayerImgBySeason(season,playerId);
        return playerImg;
    }

}
