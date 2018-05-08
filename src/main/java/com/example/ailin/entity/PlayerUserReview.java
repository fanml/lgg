package com.example.ailin.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Table(name = "player_user_review")
@Getter
@Setter
public class PlayerUserReview {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name="user_name")
    private String userName;

    @Column(name="player_id")
    private Integer playerId;

    @Column(name="grade")
    private Integer grade;

    public PlayerUserReview(){

    }
    public PlayerUserReview(String userName,int grade,int playerId){
        this.grade=grade;
        this.playerId=playerId;
        this.userName=userName;
    }

}
