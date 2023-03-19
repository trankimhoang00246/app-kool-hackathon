package com.appkool.kool.entity;

import com.google.api.client.util.DateTime;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class EventCalendar {
    private String title;
    private String description;
    private DateTime startDateTime;
    private DateTime endDateTime;
    private String email;
}
