package com.example.ailin.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Table(name="team_detail_information")
@Getter
@Setter
@RequiredArgsConstructor
@AllArgsConstructor
public class TeamDetailInformation {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name="boss_id")
    private  Integer bossId;

    @Column(name="is_deleted")
    private  Integer isDeleted;

    @Column(name="trainer_id")
    private  Integer trainerId;

    @Column(name="season_set_id")
    private  Integer seasonSetId;

    @Column(name="detail_id")
    private  Integer detailId;

    @Column(name="partition")
    private  String partition;
}
