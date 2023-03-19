package com.appkool.kool.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.HashSet;
import java.util.Set;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "users")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
//
//    @Column(name = "first_name")
//    private String firstName;

    @Column(name = "name")
    private String name;

    @Column(name = "email")
    private String email;

    @Column(name = "user_name")
    private String userName;

    @Column(name = "password")
    private String password;

    @Column(name = "avatar")
    private String avatar;

    @Column(name = "topic_fav")
    private String topicFav;

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "user")
    private Set<NoteDetail> noteDetail;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "user")
    private Set<CategoryNote> categoryNotes;

    public User(String name, String email, String userName, String password) {
//        this.firstName = firstName;
        this.name = name;
        this.email = email;
        this.userName = userName;
        this.password = password;
    }
}
