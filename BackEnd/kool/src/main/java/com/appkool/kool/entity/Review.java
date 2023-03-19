package com.appkool.kool.entity;


import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.CreationTimestamp;
import org.springframework.data.annotation.CreatedDate;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "review")
public class Review {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column(name = "date_created")
    @CreationTimestamp
    private Date dateCreated;
    @Column(name = "list_date")
    private List<LocalDateTime> listDate = new ArrayList<>();

    public Review(Long levelPrioritize) {
        LocalDateTime temp = LocalDateTime.now();
        if(levelPrioritize==1) {
            this.listDate.add(temp.plusDays(1));
            this.listDate.add(temp.plusDays(3));
            this.listDate.add(temp.plusDays(7));
            this.listDate.add(temp.plusDays(12));
            this.listDate.add(temp.plusDays(18));
            this.listDate.add(temp.plusDays(25));
            this.listDate.add(temp.plusDays(33));
            this.listDate.add(temp.plusDays(42));
            this.listDate.add(temp.plusDays(52));
            this.listDate.add(temp.plusDays(63));
        } else if (levelPrioritize==2) {
            this.listDate.add(temp.plusDays(1));
            this.listDate.add(temp.plusDays(4));
            this.listDate.add(temp.plusDays(9));
            this.listDate.add(temp.plusDays(16));
            this.listDate.add(temp.plusDays(25));
            this.listDate.add(temp.plusDays(36));
            this.listDate.add(temp.plusDays(49));
            this.listDate.add(temp.plusDays(64));
        } else {
            this.listDate.add(temp.plusDays(2));
            this.listDate.add(temp.plusDays(7));
            this.listDate.add(temp.plusDays(15));
            this.listDate.add(temp.plusDays(26));
            this.listDate.add(temp.plusDays(39));
        }
    }
}
