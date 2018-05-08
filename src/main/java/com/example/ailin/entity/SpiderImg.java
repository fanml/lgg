package com.example.ailin.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Table(name="spider_img")
@Getter
@Setter
public class SpiderImg {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "src")
    private String src;

    public SpiderImg(){super();}

    public SpiderImg(String src){
        super();
        this.src=src;
    }
}
