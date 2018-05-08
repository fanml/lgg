package com.example.ailin.controller;

import com.alibaba.fastjson.JSONObject;
import com.example.ailin.service.TeamService;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Map;

@Controller
public class TeamController {
    @Autowired
    TeamService teamService;
    //跳转teamDetail页面
    @RequestMapping(value = "toTeamDetail")
    public String toTeam(@RequestParam(value = "teamId") Integer teamId,
                         @RequestParam(value = "season",defaultValue ="1") String season,
                           ModelMap model){
         Map<String,List<Map<String,Object>>>  resultMap=teamService.getTeamAllDetailInformation(teamId,season);
        System.out.println(resultMap);
//         model.addAttribute("map",JSONObject.toJSON(resultMap));
        model.addAttribute("map",resultMap);
        model.addAttribute("teamId",teamId);
        return "newTeamDetail";
    }
    //查看球队行程
    @RequestMapping(value = "toTeamSchedule",method = RequestMethod.GET)
    public String toTeamSchedule(@RequestParam(value = "teamId") Integer teamId,
                                 @RequestParam(value = "startTime",defaultValue = "2017-8-1") String startTime,
                                 @RequestParam(value = "endTime",defaultValue = "2018-8-1") String endTime,
                                 ModelMap model){
        List<Map<String,Double>> resultList=teamService.getTeamScheduleByTeamId(teamId,startTime,endTime);
        model.addAttribute("list", JSONObject.toJSONString(resultList));
        return "teamTrail";
    }
    //toAllteamGis
    @RequestMapping(value = "toAllTeamGis")
    public String toAllTeamGis(ModelMap model){
        List<Map<String,Object>> list=teamService.findAllTeam();
        model.addAttribute("list",JSONObject.toJSONString(list));
        return "allTeamGis";
    }
//  to teamHistory
     @RequestMapping("teamHistory")
     public String teamHistory(@RequestParam(value = "teamId") Integer teamId,
                               ModelMap modelMap){
         Map<String,Object> map=teamService.getTeamById(teamId);
         List<Map<String,Object>> list=teamService.getTeamHistoryById(teamId);
         System.out.println("map"+map);
         System.out.println("list"+list);
         modelMap.addAttribute("map",map);
         modelMap.addAttribute("list",list);
         return "teamHistory";
     }


}