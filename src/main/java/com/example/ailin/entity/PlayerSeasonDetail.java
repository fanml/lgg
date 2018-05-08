package com.example.ailin.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.math.BigDecimal;

@Entity
@Table(name = "player_season_detail")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class PlayerSeasonDetail {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name="player_id")
    private  Integer playerId;

    @Column(name="account")
    private  Integer account;

    @Column(name="team_id")
    private  Integer teamId;

    @Column(name="season")
    private  String season;

    @Column(name="injury")
    private  String injury;

    @Column(name="img")
    private  String img;

    @Column(name="salary")
    private BigDecimal salary;

    @Column(name="time")
    private  Double time;

    @Column(name="fire")
    private  Double fire;

    @Column(name="block_shot")
    private  Double blockShot;

    @Column(name="hit_rate")
    private  Double hitRate;

    public PlayerSeasonDetail(Integer playerId){
//        this.count=count;
        this.playerId=playerId;
    }
}
