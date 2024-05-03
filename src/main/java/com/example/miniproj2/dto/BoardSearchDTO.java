package com.example.miniproj2.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class BoardSearchDTO {
    private Long id;
    private String title;
    private String content;
    private String writer;
}
