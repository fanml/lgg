package com.example.ailin.entity;


import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Table(name="users")
@Getter
@Setter
public class Users {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Integer id;

  @Column(name="user_name")
  private String userName;

  @Column(name="id_card")
  private  String idCard;

  @Column(name="password")
  private  String password;

  @Column(name="telephone")
  private  String telephone;

  @Column(name="email")
  private  String email;

  @Column(name="location")
  private  String location;

  public Users(String userName, String password, String idCard, String telephone, String location, String email){
    super();
    this.userName=userName;
    this.password=password;
    this.email=email;
    this.idCard=idCard;
    this.location=location;
    this.telephone=telephone;
  }
  public Users(){super();}
}
