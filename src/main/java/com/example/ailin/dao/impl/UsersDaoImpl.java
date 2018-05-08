package com.example.ailin.dao.impl;

import com.example.ailin.dao.UsersDao;
import com.example.ailin.entity.Users;
import com.example.ailin.repository.UsersRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public class UsersDaoImpl implements UsersDao {
    @Autowired
    UsersRepository usersRepository;
    @Override
    public List<Users> login(String username, String pwd) {
        List<Users> list=usersRepository.findUsersByUserNameAndPassword(username,pwd);
        return list;
    }

    @Override
    public void addUser(String username, String psw, String idCard, String tel, String location, String email) {

    }

    @Override
    public Users addUsers(Users users) {
        Users addUsers=usersRepository.save(users);
        return addUsers;
    }

    @Override
    public List<Users> findByUsername(String username) {
        List<Users> list=usersRepository.findUsersByUserName(username);
        return list;
    }
}
