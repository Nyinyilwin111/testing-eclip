package com.spring.model;

import javax.persistence.*;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;

@Getter
@Setter
@ToString
@Entity
@Table(name = "movies") // Optional table name customization
public class Movie {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;  // Changed from Long to int if using MySQL AUTO_INCREMENT
    
    @Column(nullable = false)
    private String title;
    
    private String filename;
    private long fileSize;
    
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "upload_time") // Optional column name customization
    private Date uploadTime;
}