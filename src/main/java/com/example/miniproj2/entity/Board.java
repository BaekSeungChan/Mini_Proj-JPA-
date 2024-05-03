package com.example.miniproj2.entity;

import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import java.util.Date;

@Entity
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Setter
@Getter
@ToString
@Table(name = "BOARD")
public class Board {

    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(length = 60)
    private String writer;

    @Column(length = 300)
    private String title;

    @Column @Lob
    private String content;

    @Column(length = 20)
    private String password;

    @Column
    private int readCount;

    @CreationTimestamp
    private Date writeTime;

    @UpdateTimestamp
    private Date editTime;
}
