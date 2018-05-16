package com.example.ailin.service.impl;

import com.example.ailin.entity.Log;
import com.example.ailin.repository.LogRepository;
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
    @Override
    public List<Map<String, Object>> getAllLog() {
        List<Log> logList=logRepository.findAllLog();
        List<Map<String, Object>> resultList =new ArrayList<>();
        if(!CollectionUtils.isEmpty(logList)){
        for (Log log:logList){
            Map<String,Object> map=new HashMap<>();
            map.put("userName",log.getUserName());
            map.put("ip",log.getIp());
            map.put("object",log.getObject());
            map.put("operate",log.getOperate());
            map.put("logDetail",log.getLogDetaile());
            resultList.add(map);
        }
         }
        return resultList;
    }
}
