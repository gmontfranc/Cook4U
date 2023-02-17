package com.cook4u.controller;

import com.cook4u.model.auth.AuthUtils;
import com.cook4u.model.dto.SignupDto;
import com.cook4u.model.dto.UserDto;
import com.cook4u.model.dto.mapper.GlobalMapper;
import com.cook4u.model.role.Role;
import com.cook4u.model.role.RoleEntity;
import com.cook4u.model.user.UserEntity;
import com.cook4u.service.RoleService;
import com.cook4u.service.UserService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

@RestController
@RequestMapping("/api/user")
@CrossOrigin(origins = "http://localhost:4200")
public class UserController {

    private final UserService userService;
    private final RoleEntity cookRole;
    private final AuthUtils authUtils;

    private GlobalMapper mapper;


    public UserController(UserService userService, RoleService roleService, AuthUtils authUtils, GlobalMapper mapper) {
        this.userService = userService;
        this.authUtils = authUtils;
        cookRole = roleService.findByName(Role.Cook);
        this.mapper = mapper;
    }


    @GetMapping("/")
    @PreAuthorize("hasAuthority('Admin')")
    public Iterable<UserEntity> getAllUsers() {
        return this.userService.findAll();
    }

    @PostMapping("/create")
    @PreAuthorize("hasAuthority('Admin')")
    public UserEntity createCook(@RequestBody SignupDto cook) {
        return authUtils.SignupUser(cook, cookRole);
    }

    @GetMapping("/ck/{id}")
    @PreAuthorize("hasAuthority('User')")
    public UserDto getCookById(@PathVariable Long id) throws Exception {
        Optional<UserEntity> userEntity = this.userService.findById(id);
        if(userEntity.isPresent()) {
            return mapper.convertUserEntityToDto(userEntity.get());
        }
        throw new RuntimeException(String.format("Not found with id %s", id));
    }
    
    @GetMapping("/us/{id}")
    @PreAuthorize("hasAuthority('Cook')")
    public UserDto getUserById(@PathVariable Long id) throws Exception {
        Optional<UserEntity> userEntity = this.userService.findById(id);
        if(userEntity.isPresent()) {
            return mapper.convertUserEntityToDto(userEntity.get());
        }
        throw new RuntimeException(String.format("Not found with id %s", id));
    }


}
