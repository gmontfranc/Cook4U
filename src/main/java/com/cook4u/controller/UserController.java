package com.cook4u.controller;

import com.cook4u.model.user.UserEntity;
import com.cook4u.service.impl.UserService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/user")
public class UserController {

    private UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/users")
    @PreAuthorize("hasAuthority('crud:user')")
    public Iterable<UserEntity> getAllUsers() {
        return this.userService.findAll();
    }

    @PostMapping("/users")
    @PreAuthorize("hasAuthority('crud:user')")
    public UserEntity create(@RequestBody UserEntity user) {
        return userService.create(user);
    }
}
