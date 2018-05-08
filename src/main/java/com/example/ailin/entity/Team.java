package com.example.ailin.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Table(name="team")
@Getter
@Setter
public class Team {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name="team_name")
    private String teamName;

    @Column(name="city_name")
    private String cityName;

    @Column(name="english_name")
    private  String englishName;

    @Column(name="img")
    private  String img;

    @Column(name="city_lng")
    private  Double cityLng;

    @Column(name="city_lat")
    private  Double cityLat;

    @Column(name="detail_id")
    private  Integer detailId;

    @Column(name="city_information")
    private  String cityInformation;

    @Column(name="is_deleted")
    private  Integer isDeleted;
}
