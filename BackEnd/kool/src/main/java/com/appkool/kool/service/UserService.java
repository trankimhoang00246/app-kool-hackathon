package com.appkool.kool.service;

import com.appkool.kool.dto.UserDto;
import com.appkool.kool.entity.User;
import com.appkool.kool.respository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class UserService {
    @Autowired
    private UserRepository userRepository;

    public void save(UserDto userDto) {
        User user = new User(
                userDto.getName(),
                userDto.getEmail(),
                userDto.getUserName(),
                userDto.getPassword()
        );
        userRepository.save(user);
    }
    public User save(User user) {
        return userRepository.save(user);
    }

    public Long checkPasswordUser(String username, String password) {
        User user = userRepository.findUserByUserName(username);
        if (user.getPassword().equals(password)) return user.getId();
        return null;
    }

    public Boolean checkUserbyEmail(String email) {
        User user = userRepository.findUserByEmail(email);
        if(user==null) return false;
        return true;
    }

    public Boolean checkUserbyUserName(String userName) {
        User user = userRepository.getUserByUserName(userName);
        if(user==null) return false;
        return true;
    }

    public User getUserbyUserName(String userName) {
        User user = userRepository.getUserByUserName(userName);
        return user;
    }

    public User getUserbyEmail(String email) {
        return userRepository.getUserByEmail(email);
    }

    public Optional<User> getUserById(Long id) {
        return userRepository.findById(id);
    }

    public List<User> findAll() {
        return userRepository.findAll();
    }
}
