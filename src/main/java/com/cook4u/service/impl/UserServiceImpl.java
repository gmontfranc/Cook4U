package com.cook4u.service.impl;

import com.cook4u.model.role.Role;
import com.cook4u.model.user.UserEntity;
import com.cook4u.model.user.UserRepository;
import com.cook4u.service.UserService;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class UserServiceImpl implements UserService {

    private UserRepository userRepository;

    public UserServiceImpl(UserRepository userRepository) {
        this.userRepository = userRepository;
    }
    @Override
    public UserEntity create(UserEntity user) {
        return userRepository.save(user);
    }

    @Override
    public Iterable<UserEntity> findAll() {
        return userRepository.findAll();
    }

    @Override
    public Optional<UserEntity> findById(Long id) {
        return userRepository.findById(id);
    }

    @Override
    public Optional<UserEntity> findByEmail(String email) {
        return userRepository.findByEmail(email);
    }

    @Override
    public List<UserEntity> findAllByRoleName(Role name) {
        return userRepository.findAllByRoleName(name);
    }
}
