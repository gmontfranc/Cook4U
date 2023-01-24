package com.cook4u.model.auth;

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

    public UserEntity SignupUser(SignupRequest signupRequest, RoleEntity role) {
       UserEntity user = new UserEntity();
        user.setActive(true);
        user.setEmail(signupRequest.getEmail());
        user.setFirstname(signupRequest.getFirstname());
        user.setLastname(signupRequest.getLastname());
        user.setAge(signupRequest.getAge());
        user.setRole(role);
        user.setPassword(passwordEncoder.encode(signupRequest.getPassword()));
        return userService.create(user);
    }
}
