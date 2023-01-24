package com.cook4u.controller;

import com.cook4u.model.auth.AuthUtils;
import com.cook4u.model.auth.SignupRequest;
import com.cook4u.model.role.Role;
import com.cook4u.model.role.RoleEntity;
import com.cook4u.model.role.RoleRepository;
import com.cook4u.model.user.UserEntity;
import com.cook4u.service.UserService;
import lombok.AllArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

@RestController
@AllArgsConstructor
@RequestMapping("/api/user")
public class UserController {

    private final UserService userService;
    private final RoleRepository roleRepository;
    private final RoleEntity cookRole = roleRepository.findByName(Role.Cook);
    private final AuthUtils authUtils;


    @GetMapping("/users")
    @PreAuthorize("hasAuthority('crud:user')")
    public Iterable<UserEntity> getAllUsers() {
        return this.userService.findAll();
    }

    @PostMapping("/users")
    @PreAuthorize("hasAuthority('crud:user')")
    public UserEntity createCook(@RequestBody SignupRequest cook) {
        return authUtils.SignupUser(cook, cookRole);
    }
}
