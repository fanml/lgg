package com.example.ailin.repository;


import com.example.ailin.entity.SpiderImg;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.CrudRepository;

public interface SpiderImgRepository extends CrudRepository<SpiderImg, Integer>,
        JpaSpecificationExecutor<SpiderImg> {

}
