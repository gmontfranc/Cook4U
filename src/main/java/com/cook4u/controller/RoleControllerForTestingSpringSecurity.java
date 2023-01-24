package com.cook4u.controller;

import com.cook4u.model.role.RoleEntity;
import com.cook4u.model.user.UserEntity;
import com.cook4u.service.RoleService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.security.RolesAllowed;

@RestController
@RequestMapping("/api")
public class RoleControllerForTestingSpringSecurity {

    private RoleService roleService;

    public RoleControllerForTestingSpringSecurity(RoleService roleService) {
        this.roleService = roleService;
    }

    @GetMapping("/roles")
    @PreAuthorize("hasAuthority('Admin')")
    public Iterable<RoleEntity> getAllUsers() {
        return this.roleService.findAll();
    }
}
