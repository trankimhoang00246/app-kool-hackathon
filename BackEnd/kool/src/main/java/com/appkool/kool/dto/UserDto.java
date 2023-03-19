package com.appkool.kool.dto;

import jakarta.persistence.Column;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserDto {
    private String name;
    private String email;
    private String userName;
    private String password;
    private String checkPassword;

//    public UserDto () {}

//    public UserDto(String firstName, String lastName, String email, String userName, String password, String checkPassword) {
//        this.firstName = firstName;
//        this.lastName = lastName;
//        this.email = email;
//        this.userName = userName;
//        this.password = password;
//        this.checkPassword = checkPassword;
//    }
}
