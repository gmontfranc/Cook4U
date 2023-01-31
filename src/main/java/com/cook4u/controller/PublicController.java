package com.cook4u.controller;


import com.cook4u.model.dto.UserDto;
import com.cook4u.model.dto.mapper.GlobalMapper;
import com.cook4u.model.role.Role;
import com.cook4u.model.user.UserEntity;
import com.cook4u.service.RoleService;
import com.cook4u.service.UserService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/public")
public class PublicController {

    private UserService userService;
    private GlobalMapper mapper;


    public PublicController(UserService userService, GlobalMapper globalMapper) {
        this.userService = userService;
        this.mapper = globalMapper;
    }
    @GetMapping("/cooks")
    public List<UserDto> getAllCooks() {
        return mapper.convertUserEntityToDto(this.userService.findAllByRoleName(Role.Cook));
    }


}
