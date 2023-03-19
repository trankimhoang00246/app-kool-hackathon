package com.appkool.kool.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class NoteDetailDto {
    private String topic;
    private Long level;
    private String header;
    private String contentNote;

}
