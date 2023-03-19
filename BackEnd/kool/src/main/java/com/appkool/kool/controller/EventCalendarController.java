package com.appkool.kool.controller;

import com.appkool.kool.entity.EventCalendar;
import com.appkool.kool.service.EventCalendarService;
import com.google.api.services.calendar.model.Event;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.security.GeneralSecurityException;

@RestController
@RequestMapping("/Callback")
public class EventCalendarController {
    @Autowired
    EventCalendarService eventCalendarService;

    @GetMapping("getevents")
    public String getEvents() throws GeneralSecurityException, IOException {
        return eventCalendarService.getEvents();
    }
}
