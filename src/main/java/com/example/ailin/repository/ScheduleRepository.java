package com.example.ailin.repository;

import com.example.ailin.entity.Schedule;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.sql.Date;
import java.util.List;

public interface ScheduleRepository extends CrudRepository<Schedule, Integer>,
        JpaSpecificationExecutor<Schedule> {

    @Query(value = "select s from Schedule s where s.guestTeamId=?1 or s.hostTeamId=?1 and s.fixture between ?2 and ?3  order by s.fixture")
    List<Schedule> findListByTeamId(Integer teamId, Date startTime,Date endTime);
}
