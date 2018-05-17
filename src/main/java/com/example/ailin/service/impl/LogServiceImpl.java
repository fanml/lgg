package com.example.ailin.service.impl;

import com.example.ailin.entity.Log;
import com.example.ailin.entity.Users;
import com.example.ailin.repository.LogRepository;
import com.example.ailin.repository.UsersRepository;
import com.example.ailin.service.LogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class LogServiceImpl implements LogService {
    @Autowired
    LogRepository logRepository;
    @Autowired
    UsersRepository usersRepository;
    @Override
    public List<Map<String, Object>> getAllLog() {
        List<Log> logList=logRepository.findAllLog();
        List<Map<String, Object>> resultList =new ArrayList<>();
        if(!CollectionUtils.isEmpty(logList)){
        for (Log log:logList){
            Map<String,Object> map=new HashMap<>();
            map.put("userName",log.getUserName());
            map.put("ip",log.getIp());
            map.put("id",log.getId());
            map.put("time",log.getTime());
            map.put("object",log.getObject());
            map.put("operate",log.getOperate());
            map.put("logDetail",log.getLogDetaile());
            resultList.add(map);
        }
         }
        return resultList;
    }

    @Override
    public void deleteLogById(String logId) {
        if(logId.equals("all")){
            logRepository.updateAll();
        } else{
            Integer id=Integer.parseInt(logId);
            logRepository.update(id);
        }
    }

    @Override
    public List<Map<String, Object>> getAllUsers() {
        List<Users> usersList=usersRepository.findAllUsers();
        List<Map<String, Object>> resultList =new ArrayList<>();
        for(Users users:usersList){
            Map<String,Object> map=new HashMap<>();
            map.put("userName",users.getUserName());
            map.put("idCard",users.getIdCard());
            map.put("telephone",users.getTelephone());
            map.put("email",users.getEmail());
            map.put("location",users.getLocation());
            map.put("id",users.getId());
            resultList.add(map);
        }
        return resultList;
    }

    @Override
    public void deleteUsersById(String userId) {
        if(userId.equals("all")){
            usersRepository.deleteAll();
        } else{
            Integer id=Integer.parseInt(userId);
            usersRepository.delete(id);
        }
    }
}
