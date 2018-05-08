package com.example.ailin.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Table(name="secret_answer")
@Getter
@Setter
public class SecretAnswer {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name="user_name")
    private String userName;

    @Column(name="question_id")
    private  Integer questionId;

    @Column(name="answer")
    private  String answer;

    public SecretAnswer(){super();}

    public SecretAnswer(String userName,Integer questionId,String answer){
        this.userName=userName;
        this.questionId=questionId;
        this.answer=answer;
    }
}
