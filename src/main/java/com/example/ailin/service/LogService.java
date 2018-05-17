package com.example.ailin.service;

import java.util.List;
import java.util.Map;

public interface LogService {
    List<Map<String,Object>> getAllLog();

    void deleteLogById(String logId);

    List<Map<String,Object>> getAllUsers();

    void deleteUsersById(String userId);
}
