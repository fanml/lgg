package com.example.ailin.dao;

import com.example.ailin.entity.Users;

import java.util.List;

public interface UsersDao {
    List<Users> login(String username, String pwd);

    void addUser(String username, String psw, String idCard, String tel, String location, String email);

    Users addUsers(Users users);

    List<Users> findByUsername(String username);
}
