package com.prj1.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.time.LocalDateTime;

@Getter
@Setter
@ToString
@AllArgsConstructor
public class Board {
    private Integer id;
    private String title;
    private String content;
    private String writer;
    private LocalDateTime inserted;
}
