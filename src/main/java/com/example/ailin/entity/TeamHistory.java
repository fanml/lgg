package com.example.ailin.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Table(name = "team_history")
@Getter
@Setter
public class TeamHistory {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "team_id")
    private Integer teamId;

    @Column(name = "interval")
    private String interval;

    @Column(name = "history_detail")
    private String historyDetail;
}
