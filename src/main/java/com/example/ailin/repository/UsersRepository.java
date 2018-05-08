package com.example.ailin.repository;

import com.example.ailin.entity.Users;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface UsersRepository extends CrudRepository<Users, Integer>,
        JpaSpecificationExecutor<Users> {

//    @Query(value="select u from users u where u.userName=?1 and u.password=?2 ")
    List<Users> findUsersByUserNameAndPassword (String username, String password);

    List<Users> findUsersByUserName(String username);

}
