package com.cook4u.model.auth;

import com.cook4u.model.role.Role;
import com.cook4u.model.role.RoleEntity;
import com.cook4u.model.role.RoleRepository;
import com.cook4u.model.user.UserEntity;
import com.cook4u.model.user.UserRepository;
import lombok.AllArgsConstructor;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

@Component
@AllArgsConstructor
public class AuthUtils {

    private UserRepository userRepository;
    private PasswordEncoder passwordEncoder;

    private RoleRepository roleRepository;

    private final RoleEntity userRole = roleRepository.findByName(Role.User);

    public UserEntity createUserForSignup(SignupRequest signupRequest) {
       UserEntity user = new UserEntity();
        user.setActive(true);
        user.setEmail(signupRequest.getEmail());
        user.setFirstname(signupRequest.getFirstname());
        user.setLastname(signupRequest.getLastname());
        user.setAge(signupRequest.getAge());
        user.setRole(userRole);
        user.setPassword(passwordEncoder.encode(signupRequest.getPassword()));
        return userRepository.save(user);
    }
}
