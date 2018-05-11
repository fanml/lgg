package com.example.ailin.tool;

import com.example.ailin.dao.PlayerDao;
import com.example.ailin.dao.TeamDao;
import com.example.ailin.entity.Log;
import com.example.ailin.entity.Player;
import com.example.ailin.entity.Team;
import com.example.ailin.repository.LogRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


@Component
public class OperateLog {
    private static LogRepository logRepository;
    private static TeamDao teamDao;
    private static PlayerDao playerDao;
    @Autowired
    public OperateLog(LogRepository logRepository,TeamDao teamDao,PlayerDao playerDao){
        OperateLog.logRepository=logRepository;
        OperateLog.teamDao=teamDao;
        OperateLog.playerDao=playerDao;
    }
    public static void logLogin(LogOperateType logOperateType){
        List<String> list=getIpAndUserName();
        String ip="";
        String username="";
        String time=time();
        String object="All";
        if(list.size()>1){
            ip=list.get(0);
            username=list.get(1);
        }
        String logDetaile=username+"在"+time+logOperateType.getDesc()+"系统";
        save(logOperateType.getDesc(),ip,username,time,object,logDetaile);
    }
    private static List<String> getIpAndUserName(){
        List<String> list=new ArrayList<>();
        HttpServletRequest httpServletRequest =
                ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        String userName = null;
        String ip = null;
        if(httpServletRequest!=null){
            ip=CommonUtil.getIpAddr(httpServletRequest);
            HttpSession session=httpServletRequest.getSession();
            if(session.getAttribute("username")!=null){
                userName=(String)session.getAttribute("username");

            }else{
                userName=" ";
            }
            list.add(ip);
            list.add(userName);
        }
        return list;
    }
    private static String time (){
        Date date=new Date();
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy/MM/dd hh:mm:ss");
        String time=sdf.format(date);
        return  time;
    }
    private static void save(String operate,String ip,String userName,String time,String object,String logDetaile){
        Log log=new Log(userName,operate,time,object,logDetaile,ip);
        logRepository.save(log);
    }

    public static void logRegister(LogOperateType logOperateType,String name) {
        List<String> list=getIpAndUserName();
        String ip="";
        String username="";
        String time=time();
        String object="All";
        if(list.size()>1){
            ip=list.get(0);
            username=list.get(1);
        }
        String logDetaile="新用户"+name+"于"+time+logOperateType.getDesc();
        save(logOperateType.getDesc(),ip,name,time,object,logDetaile);
    }


    public static void logTeamDetail(LogOperateType logOperateType, Integer teamId, String season) {
        List<String> list=getIpAndUserName();
        String ip="";
        String username="";
        String time=time();
        if(list.size()>1){
            ip=list.get(0);
            username=list.get(1);
        }
        if(season.equals("1")){
            season="当前";
        }
        Team team=teamDao.findOne(teamId);
        String object=team.getTeamName();
        String logDetaile=username+"于"+time+logOperateType.getDesc()+object+season+"赛季的详细信息";
        save(logOperateType.getDesc(),ip,username,time,object,logDetaile);
    }

    public static void logTeamSchedule(LogOperateType logOperateType, Integer teamId, String startTime, String endTime) {
        List<String> list=getIpAndUserName();
        String ip="";
        String username="";
        String time=time();
        if(list.size()>1){
            ip=list.get(0);
            username=list.get(1);
        }
        Team team=teamDao.findOne(teamId);
        String object=team.getTeamName();
        String logDetaile=username+"在"+time+logOperateType.getDesc()+object+"在"+startTime+"至"+endTime+"期间的赛程";
        save(logOperateType.getDesc(),ip,username,time,object,logDetaile);
    }

    public static void AllTeamGis(LogOperateType logOperateType) {
        List<String> list=getIpAndUserName();
        String ip="";
        String username="";
        String time=time();
        String object="All";
        if(list.size()>1){
            ip=list.get(0);
            username=list.get(1);
        }
        String logDetaile=username+"在"+time+logOperateType.getDesc()+"所有球队的GIS页面";
        save(logOperateType.getDesc(),ip,username,time,object,logDetaile);
    }

    public static void TeamHistory(LogOperateType logOperateType, Integer teamId) {
        List<String> list=getIpAndUserName();
        String ip="";
        String username="";
        String time=time();
        if(list.size()>1){
            ip=list.get(0);
            username=list.get(1);
        }
        Team team=teamDao.findOne(teamId);
        String object=team.getTeamName();
        String logDetaile=username+"在"+time+logOperateType.getDesc()+object+"的发展历史";
        save(logOperateType.getDesc(),ip,username,time,object,logDetaile);
    }

    public static void addAnswer(LogOperateType logOperateType, String name) {
        List<String> list=getIpAndUserName();
        String ip="";
        String username="";
        String time=time();
        String object="All";
        if(list.size()>1){
            ip=list.get(0);
            username=list.get(1);
        }
        String logDetaile="新用户"+name+"在"+time+logOperateType.getDesc()+"密保问题";
        save(logOperateType.getDesc(),ip,name,time,object,logDetaile);
    }

    public static void answerValidate(LogOperateType logOperateType, String name) {
        List<String> list=getIpAndUserName();
        String ip="";
        String username="";
        String time=time();
        String object="All";
        if(list.size()>1){
            ip=list.get(0);
            username=list.get(1);
        }
        String logDetaile=name+"在"+time+"进行了找回密码"+logOperateType.getDesc();
        save(logOperateType.getDesc(),ip,name,time,object,logDetaile);
    }

    public static void playerAssess(LogOperateType logOperateType, Integer playerId,String mess) {
        List<String> list=getIpAndUserName();
        String ip="";
        String username="";
        String time=time();
        if(list.size()>1){
            ip=list.get(0);
            username=list.get(1);
        }
        Player player=playerDao.getByPlayerId(playerId);
        String object=player.getName();
        String logDetaile=username+"在"+time+logOperateType.getDesc()+object+"的"+mess;
        save(logOperateType.getDesc(),ip,username,time,object,logDetaile);
    }

    public static void setGread(LogOperateType logOperateType, String grade, String playerId) {
        List<String> list=getIpAndUserName();
        String ip="";
        String username="";
        String time=time();
        if(list.size()>1){
            ip=list.get(0);
            username=list.get(1);
        }
        int iplayerId=Integer.parseInt(playerId);
        Player player=playerDao.getByPlayerId(iplayerId);
        String object=player.getName();
        String logDetaile=username+"在"+time+logOperateType.getDesc()+"对"+object+"的"+grade+"分评分";
        save(logOperateType.getDesc(),ip,username,time,object,logDetaile);
    }

    public static void allPlayer(LogOperateType logOperateType) {
        List<String> list=getIpAndUserName();
        String ip="";
        String username="";
        String time=time();
        String object="All";
        if(list.size()>1){
            ip=list.get(0);
            username=list.get(1);
        }
        String logDetaile=username+"在"+time+logOperateType.getDesc()+"所有球员";
        save(logOperateType.getDesc(),ip,username,time,object,logDetaile);
    }
}
