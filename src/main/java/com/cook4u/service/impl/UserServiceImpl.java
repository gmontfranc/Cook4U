package com.cook4u.service.impl;

import com.cook4u.model.user.UserEntity;
import com.cook4u.model.user.UserRepository;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService{

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
}
