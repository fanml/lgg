package com.example.ailin.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Table(name="season_set")
@Getter
@Setter
public class SeasonSet {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name="champion")
    private  Integer champion;

    @Column(name="player_set_id")
    private  Integer playerSetId;

    @Column(name="season_set_id")
    private  Integer seasonSetId;

    @Column(name="season")
    private  String season;

    @Column(name="description")
    private  String description;

    @Column(name="wins")
    private  Integer wins;
}
