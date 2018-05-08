package com.example.ailin.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Table(name="player_set")
@Getter
@Setter
public class PlaySet {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name="player_id")
    private String playerId;
}
