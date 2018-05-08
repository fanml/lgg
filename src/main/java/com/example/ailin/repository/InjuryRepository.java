package com.example.ailin.repository;

import com.example.ailin.entity.Injury;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface InjuryRepository extends CrudRepository<Injury, Integer>,
        JpaSpecificationExecutor<Injury> {
        Injury findAllById(Integer id);
}
