package com.example.ailin.service.impl;

import com.example.ailin.dao.PlayerDao;
import com.example.ailin.dao.TeamDao;
import com.example.ailin.entity.*;
import com.example.ailin.service.TeamService;
import com.example.ailin.service.constant.ServiceConstant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@Service
public class TeamServiceImpl implements TeamService {
    @Autowired
    TeamDao teamDao;
    @Autowired
    PlayerDao playerDao;

//    处理时间
    private java.sql.Date time(String oldTime){
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
        Date newTime=null;
        java.sql.Date date=null;
        try {
             newTime=sdf.parse(oldTime);
             date=  new java.sql.Date(newTime.getTime());
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return date;
    }
//    某个球队行程
    @Override
    public List<Map<String, Double>> getTeamScheduleByTeamId(Integer teamId,String startTime,String endTime) {
        Team hostTeam=null;
        Team guestTeam=null;
        java.sql.Date newStartTime=null;
        if(StringUtils.isEmpty(startTime)){
           Date newUtilStartTime=new Date();
            newStartTime=new java.sql.Date(newUtilStartTime.getTime());
        }else{
            newStartTime=time(startTime);
        }
        if(StringUtils.isEmpty(endTime)){
            endTime="2018-08-01";
        }
        java.sql.Date newEndTime=time(endTime);
        Team inputTeam=teamDao.findOne(teamId);
        List<Schedule> scheduleList=teamDao.findScheduleByTeamId(teamId,newStartTime,newEndTime);
        List<Map<String, Object>> resultList =new ArrayList<>();
        for(Schedule schedule:scheduleList){
            if(schedule.getHostTeamId()==teamId){
                guestTeam=teamDao.findOne(schedule.getGuestTeamId());
                hostTeam=inputTeam;
            }else{
                guestTeam=inputTeam;
                hostTeam=teamDao.findOne(schedule.getHostTeamId());
            }
            Map<String, Object> scheduleMap=new HashMap<>();
            scheduleMap.put(ServiceConstant.HOSTTEAM,hostTeam);
            scheduleMap.put(ServiceConstant.GUESTTEAM,guestTeam);
            scheduleMap.put(ServiceConstant.FIXTURE,schedule.getFixture());
            resultList.add(scheduleMap);
        }
        if(CollectionUtils.isEmpty(resultList)) return null;
        List<Map<String,Double>> finalList=new ArrayList<>();
        for(int i=0;i<resultList.size();i++) {
//            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            java.sql.Date date2 = null;
            java.sql.Date date1 = null;
            Map<String, Double> finalMap = new HashMap<>();
//            不是主场
            Team nowHostTeam = (Team) (resultList.get(i).get(ServiceConstant.HOSTTEAM));
            if (!nowHostTeam.getTeamName().equals(inputTeam)) {
                //连续客场
                Team startTeam = (Team) (resultList.get(i).get(ServiceConstant.GUESTTEAM));//第一场客队
                Team hostStartTeam = (Team) (resultList.get(i).get(ServiceConstant.HOSTTEAM));//第一场主队
                if(i!=resultList.size()-1) {
                    Team endTeam = (Team) (resultList.get(i + 1).get(ServiceConstant.GUESTTEAM));//第二场客队
                    Team hostEndTeam = (Team) (resultList.get(i + 1).get(ServiceConstant.HOSTTEAM));//第二场主队
                    date2 =  (java.sql.Date )resultList.get(i + 1).get(ServiceConstant.FIXTURE);
                    date1 = (java.sql.Date )resultList.get(i).get(ServiceConstant.FIXTURE);
                    if (date2.getTime() - date1.getTime() <= 24 * 60 * 60 * 1000 && endTeam.getTeamName().equals(inputTeam.getTeamName()) && startTeam.getTeamName().equals(inputTeam.getTeamName())) {
                        finalMap.put(ServiceConstant.STARTCITYLNG, hostStartTeam.getCityLng());
                        finalMap.put(ServiceConstant.STARTCITYLAT, hostStartTeam.getCityLat());
                        finalMap.put(ServiceConstant.ENDCITYLNG, hostEndTeam.getCityLng());
                        finalMap.put(ServiceConstant.ENDCITYLAT, hostEndTeam.getCityLat());

//                } else if(date2.getTime() - date1.getTime() > 24 * 60 * 60 * 1000&& endTeam.getTeamName().equals(inputTeam.getTeamName())&&startTeam.getTeamName().equals(inputTeam.getTeamName())) {

                    }else {
                        finalMap.put(ServiceConstant.STARTCITYLNG, inputTeam.getCityLng());
                        finalMap.put(ServiceConstant.STARTCITYLAT, inputTeam.getCityLat());
                        finalMap.put(ServiceConstant.ENDCITYLNG, hostStartTeam.getCityLng());
                        finalMap.put(ServiceConstant.ENDCITYLAT, hostStartTeam.getCityLat());
                    }
                }else{
                    finalMap.put(ServiceConstant.STARTCITYLNG, inputTeam.getCityLng());
                    finalMap.put(ServiceConstant.STARTCITYLAT, inputTeam.getCityLat());
                    finalMap.put(ServiceConstant.ENDCITYLNG, hostStartTeam.getCityLng());
                    finalMap.put(ServiceConstant.ENDCITYLAT, hostStartTeam.getCityLat());
                }
            }
            finalList.add(finalMap);
        }
        return finalList;
    }

//    获得所有球队的lng lat team_name english_name
    @Override
    public List<Map<String, Object>> findAllTeam() {
        List<Team> teamList=teamDao.findAllTeam();
        List<Map<String, Object>> resultList=new ArrayList<>();
        for(Team team:teamList){
            Map<String, Object> teamMap=new HashMap<>();
            teamMap.put(ServiceConstant.TEAMLNG,team.getCityLng());
            teamMap.put(ServiceConstant.TEAMLAT,team.getCityLat());
            teamMap.put(ServiceConstant.TEAMNAME,team.getTeamName());
            teamMap.put(ServiceConstant.TEAMENGLISHNAME,team.getEnglishName());
            teamMap.put(ServiceConstant.TEAMID,team.getId());
            teamMap.put(ServiceConstant.TEAMCITYDETAIL,team.getCityInformation());
            resultList.add(teamMap);
        }
        return resultList;
    }

//    获得球队详情页面teamDetail的所有数据
    @Override
    public Map<String, List<Map<String, Object>>> getTeamAllDetailInformation(Integer teamId,String Iseason) {
//      获得当前球队
        Team team= teamDao.findOne(teamId);
        Map<String,Object> teamMap=new HashMap<>();
        teamMap.put(ServiceConstant.TEAMNAME,team.getTeamName());
        teamMap.put(ServiceConstant.TEAMENGLISHNAME,team.getEnglishName());
        List<Map<String,Object>> teamDetailList=new ArrayList<>();
        teamDetailList.add(teamMap);
//        获的所有冠军赛季
        List<SeasonSet>  seasonSetList= teamDao.findAllSeasonByTeamId(teamId);
        List<Map<String,Object>> championList=new ArrayList<>();
        int i=0;
        for(SeasonSet seasonSet:seasonSetList){
            i++;
            Map<String,Object> championMap=new HashMap<>();
            championMap.put(ServiceConstant.CHAMPIONSEASON+i,seasonSet.getSeason());
            championList.add(championMap);
        }
//        获取当前赛季球员
        String nowSeason=null;
        if(Iseason.equals("1")){
           nowSeason=getYear();
        }else{
            nowSeason=Iseason;
        }
        List<Map<String, Object>> playerList=getAllPlayer(teamId,nowSeason);
        Map<String, List<Map<String, Object>>> resultMap=new HashMap<>();
        resultMap.put(ServiceConstant.TEAM,teamDetailList);
        resultMap.put(ServiceConstant.CHAMPIONSEASON,championList);
        resultMap.put(ServiceConstant.PLAYER,playerList);
        return resultMap;
    }

    @Override
    public Map<String, Object> getTeamById(Integer teamId) {
        Team team=teamDao.findOne(teamId);
        Map map=new HashMap();
        map.put(ServiceConstant.TEAMNAME,team.getTeamName());
        map.put(ServiceConstant.TEAMIMG,team.getImg());
        return map;
    }

    @Override
    public List<Map<String, Object>> getTeamHistoryById(Integer teamId) {
        List<TeamHistory> list=teamDao.findOneTeamHistory(teamId);
        List<Map<String, Object>> resultList=new ArrayList<>();
        for(TeamHistory teamHistory:list){
            Map<String, Object> map=new HashMap<>();
            map.put("interval",teamHistory.getInterval());
            map.put("detail",teamHistory.getHistoryDetail());
            resultList.add(map);
        }
        return resultList;
    }

    //    获得当前年份
    private String getYear(){
        Calendar calendar=Calendar.getInstance();
        int year=calendar.get(Calendar.YEAR);
        int month=calendar.get(Calendar.MONTH)+1;
        if(month>9){
            year=year+1;
        }
        String nowSeason="%-"+year+"%";
        return nowSeason;
    }
//    获得当前年份球队的所有
    private List<Map<String, Object>> getAllPlayer(int teamId,String nowSeason){
        int playSetId=teamDao.getPlaySetByTeamIdAndSession(teamId,nowSeason);
        String playSet=teamDao.getPlaySetById(playSetId);
        String playIdList[]=playSet.split(",");
        List<Map<String, Object>>  playerList =new ArrayList<>();
        for(String a:playIdList){
            Map<String, Object> playerMap=new LinkedHashMap<>();
            int playId=Integer.parseInt(a);
            Player player=playerDao.getByPlayerId(playId);
            if(player!=null){
                playerMap.put(ServiceConstant.PLAYERID,player.getId());
                playerMap.put(ServiceConstant.PLAYEREIMG,player.getPlayerImg());
                playerMap.put(ServiceConstant.PLAYERNAME,player.getName());
                playerMap.put(ServiceConstant.PLAYERENGLISHNAME,player.getEnglishName());
                playerMap.put(ServiceConstant.PLAYERPOSITION,player.getPosition());
                playerMap.put(ServiceConstant.PLAYERHEIGHT,player.getHeight());
                playerMap.put(ServiceConstant.PLAYERWEIGHT,player.getWeight());
                playerMap.put(ServiceConstant.PLAYERNATIONLITY,player.getNationality());
                playerMap.put(ServiceConstant.PLAYEREXPERIENCE,player.getExperience());
                playerList.add(playerMap);
            }
        }
        return playerList;
    }
}
