package com.example.ailin.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Setter
@Getter
@Table(name = "log")
@NoArgsConstructor
@AllArgsConstructor
public class Log {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "user_name")
    private String userName;

    @Column(name = "operate")
    private String operate;

    @Column(name = "time")
    private String time;

    @Column(name = "object")
    private String object;

    @Column(name = "log_detaile")
    private String logDetaile;

    @Column(name = "ip")
    private String ip;

    public Log(String userName,String operate,String time,String object,String logDetaile, String ip){
        this.userName=userName;
        this.operate=operate;
        this.time=time;
        this.object=object;
        this.logDetaile=logDetaile;
        this.ip=ip;
    }
}
