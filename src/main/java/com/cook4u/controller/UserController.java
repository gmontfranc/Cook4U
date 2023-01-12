package com.cook4u.controller;

import com.cook4u.model.user.UserEntity;
import com.cook4u.service.impl.UserService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class UserController {

    private UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/users")
    public Iterable<UserEntity> getAllUsers() {
        return this.userService.findAll();
    }

    @PostMapping("/users")
    public UserEntity create(@RequestBody UserEntity user) {
        return userService.create(user);
    }
}
