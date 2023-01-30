package com.cook4u.model.auth;

import com.cook4u.model.dto.SignupDto;
import com.cook4u.model.dto.mapper.GlobalMapper;
import com.cook4u.model.role.Role;
import com.cook4u.model.role.RoleEntity;
import com.cook4u.model.role.RoleRepository;
import com.cook4u.model.user.UserEntity;
import com.cook4u.model.user.UserRepository;
import com.cook4u.service.UserService;
import lombok.AllArgsConstructor;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

@Component
@AllArgsConstructor
public class AuthUtils {

    private UserService userService;
    private PasswordEncoder passwordEncoder;
    private GlobalMapper mapper;

    public UserEntity SignupUser(SignupDto signupRequest, RoleEntity role) {
       UserEntity user = mapper.convertToUserEntity(signupRequest);
       user.setRole(role);
       user.setPassword(passwordEncoder.encode(signupRequest.getPassword()));
       return userService.create(user);
    }
}
