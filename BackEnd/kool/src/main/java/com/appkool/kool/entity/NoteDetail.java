package com.appkool.kool.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.CreationTimestamp;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "note_detail")
public class NoteDetail {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @Column(name = "date_created")
    @CreationTimestamp
    private Date dateCreated;
    @ManyToOne
    @JoinColumn(name = "category_id", nullable = false)
    private CategoryNote category;
    @Column(name = "level_prioritize")
    private Long levelPrioritize;

    @ManyToOne
    @JoinColumn(name="user_id", nullable = false)
    private User user;

    @OneToOne
    @JoinColumn(name="note_id")
    private Note note;

    @OneToOne
    @JoinColumn(name="review_id")
    private Review review;

    public NoteDetail(CategoryNote category, Long levelPrioritize, User user, Note note, Review review) {
        this.category = category;
        this.levelPrioritize = levelPrioritize;
        this.user = user;
        this.note = note;
        this.review=review;
    }
}
