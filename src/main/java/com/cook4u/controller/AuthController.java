package com.cook4u.controller;

import com.cook4u.model.auth.AuthRequest;
import com.cook4u.model.auth.AuthResponse;
import com.cook4u.model.auth.AuthUtils;
import com.cook4u.model.auth.SignupRequest;
import com.cook4u.model.dto.SignupDto;
import com.cook4u.model.role.Role;
import com.cook4u.model.role.RoleEntity;
import com.cook4u.model.role.RoleRepository;
import com.cook4u.model.user.UserEntity;
import com.cook4u.model.user.UserRepository;
import com.cook4u.security.configuration.JwtUtils;
import com.cook4u.service.RoleService;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@RestController
@RequestMapping("/api/auth")
@CrossOrigin(origins = "http://localhost:4200")
public class AuthController {
    AuthenticationManager authManager;
    JwtUtils jwtUtil;
    private final UserRepository userRepository;
    private RoleService roleService;
    private final RoleEntity userRole;


    private final AuthUtils authUtils;

    public AuthController(AuthenticationManager authManager, JwtUtils jwtUtil, UserRepository userRepository, RoleService roleService, AuthUtils authUtils) {
        this.authManager = authManager;
        this.jwtUtil = jwtUtil;
        this.userRepository = userRepository;
        this.roleService = roleService;
        this.authUtils = authUtils;
        this.userRole = roleService.findByName(Role.User);
    }

    @PostMapping("/login")
    public ResponseEntity<?> login(@RequestBody @Valid AuthRequest request) {
    	AuthResponse response = null;
        try {
            Authentication authentication = authManager.authenticate(
                    new UsernamePasswordAuthenticationToken(
                            request.getEmail(), request.getPassword())
            );

            UserEntity user = (UserEntity) authentication.getPrincipal();
            String accessToken = jwtUtil.generateAccessToken(user);
            response = new AuthResponse(accessToken);
            return ResponseEntity.ok().body(response);

        } catch (Exception ex) {
        	response = new AuthResponse("Identifiants Incorrects!");
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(response);
        }
    }
    @PostMapping("/signup")
    @ResponseStatus(code = HttpStatus.CREATED)
    public ResponseEntity<?> register(@RequestBody SignupDto signupRequest) {
        if(userRepository.findByEmail(signupRequest.getEmail()).isEmpty()) {
            //throw 409
        }
        UserEntity user = authUtils.SignupUser(signupRequest, userRole);
        String accessToken = jwtUtil.generateAccessToken(user);
        AuthResponse response = new AuthResponse(accessToken);
        return ResponseEntity.ok().body(response);
    }


}
