package com.example.ailin.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Table(name="schedule")
@Getter
@Setter
public class Schedule {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name="host_team_id")
    private Integer hostTeamId;

    @Column(name="guest_team_id")
    private  Integer guestTeamId;

    @Column(name="fixture")
    private  java.sql.Date fixture;
}
