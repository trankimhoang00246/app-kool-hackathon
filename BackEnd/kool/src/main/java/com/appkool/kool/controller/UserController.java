package com.appkool.kool.controller;

import com.appkool.kool.dto.UserDto;
import com.appkool.kool.entity.User;
import com.appkool.kool.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
public class UserController {
    @Autowired
    private UserService userService;
    @PostMapping("register")
    public String registerUserAccount(@RequestBody UserDto userDto){
        if(userService.checkUserbyEmail(userDto.getEmail())==true){
            return "emailexist";
        }
        if(userDto.getPassword().equals(userDto.getCheckPassword())==false){
            return "checkpass";
        }
        if(userService.checkUserbyUserName(userDto.getUserName())==true) {
            return "usernameexist";
        }
        userService.save(userDto);
        return "success";
    }

    @PostMapping("/login")
    public Long Login(@RequestBody UserDto userDto){
        if(userService.checkUserbyUserName(userDto.getUserName())==false){
            // -1 la usename not exist
            return null;
        }
        User user = userService.getUserbyUserName(userDto.getUserName());
        Long id = userService.checkPasswordUser(userDto.getUserName(),userDto.getPassword());
        if(id!=null){
            String userName = userDto.getUserName();
            return id;
        }
        // -2 passwordwrong
        return null;
    }

    @GetMapping("home/{id}")
    public Optional<User> getInforUSer(@PathVariable("id") Long id) {
        return userService.getUserById(id);
    }

    // sua thong tin nguoi dung
    @PutMapping("home/{id}/edit")
    public String editUser(@PathVariable("id") Long iduser, @RequestBody User user) {
        User user1 = userService.getUserById(iduser).get();

        user1.setName(user.getName());
        user1.setEmail(user.getEmail());
        user1.setAvatar(user.getAvatar());
        user1.setPassword(user.getPassword());
        user1.setTopicFav(user.getTopicFav());

        if(userService.save(user1) != null) {
            return "sucess";
        }
        return "false";
    }
}
