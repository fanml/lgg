package com.example.ailin.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.example.ailin.service.PlayerService;

import com.example.ailin.tool.LogOperateType;
import com.example.ailin.tool.OperateLog;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;

import static com.example.ailin.tool.CrawlerNBATest.testCrawler;

@Controller
public class PlayerController {
    @Autowired
    PlayerService playerService;
//    获得页面图标图片等信息
    @RequestMapping(value = "playerAssess")
    public String playerAssess(@RequestParam(value="playerId",defaultValue ="0") Integer playerId,
                               @RequestParam(value="playerName",defaultValue ="0") String playerName,
                               @RequestParam(value="season",defaultValue = "2017-2018") String season,
                               ModelMap modelMap){
        Integer nowPlayerId=playerId;
        if(nowPlayerId==0){
            nowPlayerId=playerService.getPlayerIdByName(playerName);
        }
        OperateLog.playerAssess(LogOperateType.CHECK,nowPlayerId,"详细信息");
        Map<String,Object> resultMap=playerService.getIcon(nowPlayerId,season);
        modelMap.addAttribute("map", JSONObject.toJSON(resultMap));
        return "playerAssess";
    }
//   载入赛季下拉框
    @RequestMapping(value="loadSeasonList")
    @ResponseBody
    public String loadSeasonList(@RequestParam(value="playerId") Integer playerId){
        List<String> resultList=playerService.getSeasonListByPlayerId(playerId);
        return JSONObject.toJSONString(resultList);
    }
//    球员评分
    @RequestMapping(value = "playerGrade")
    public  String playerGrade(@RequestParam(value="playerId",defaultValue ="0") Integer playerId,
                                @RequestParam(value="playerName",defaultValue ="0") String playerName,
                               ModelMap modelMap){
        Integer nowPlayerId=playerId;
        if(nowPlayerId==0){
            nowPlayerId=playerService.getPlayerIdByName(playerName);
        }
        OperateLog.playerAssess(LogOperateType.CHECK,nowPlayerId,"综合评分");
        Map<String,Object> resultMap=playerService.getGrade(nowPlayerId);
        resultMap.put("playerId",nowPlayerId);
        modelMap.addAttribute("map", JSONObject.toJSON(resultMap));
        return "grade";
    }
//    测试星星评分功能
    @RequestMapping(value = "testStart")
    public  String testStart(){
        return "testStart";
    }
//    存储用户对球员的评分
    @RequestMapping(value = "setGrade")
    @ResponseBody
    public String setGrade(@RequestParam(value = "grade") String grade,
                           @RequestParam(value = "playerId") String playerId,
                           HttpServletRequest request){
        String result="error";
        HttpSession session=request.getSession();
        String username=(String)session.getAttribute("username");
        OperateLog.setGread(LogOperateType.ADD,grade,playerId);
        if(!StringUtils.isEmpty(grade)&&!StringUtils.isEmpty(username)){
            boolean b=playerService.setGrade(username,grade,playerId);
            if(b)
                result="success";
        }
        return result+" "+" "+grade+"分";
    }
//    爬虫 所有球员
    public static List<Object> playerTrueList;
    @RequestMapping("toAllPlayer")
    public String toAllPlayer(ModelMap modelMap){
//        for(int i = 65; i <= 90; i++){
        OperateLog.allPlayer(LogOperateType.CHECK);
        if(CollectionUtils.isEmpty(playerTrueList)){
            getAllPlayerTrue();
        }
        modelMap.addAttribute("list",playerTrueList);
        return "allPlayer";
    }

    private  void getAllPlayerTrue(){
        playerTrueList=new ArrayList<>();
        for(int i = 65; i <= 90; i++){
            char ascii = (char) i;
            String url = "http://china.nba.com/static/data/league/playerlist_"+ascii+".json";
            String html=testCrawler(url);
            playerTrueList.add(html);
            try {
                Thread.sleep(100);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }

        }
    }
}
