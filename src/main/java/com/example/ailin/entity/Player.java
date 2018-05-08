package com.example.ailin.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Table(name="player")
@Getter
@Setter
public class Player {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name="name")
    private String name;

    @Column(name="position")
    private String position;

    @Column(name="english_name")
    private  String englishName;

    @Column(name="height")
    private  Double height;

    @Column(name="weight")
    private  Double weight;

    @Column(name="nationality")
    private  String nationality;

    @Column(name="experience")
    private  String experience;

    @Column(name="player_img")
    private  String playerImg;
}
