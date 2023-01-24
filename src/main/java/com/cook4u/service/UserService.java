package com.cook4u.service;

import com.cook4u.model.user.UserEntity;

import java.util.Optional;

public interface UserService {

    UserEntity create(UserEntity user);

    Iterable<UserEntity> findAll();


    Optional<UserEntity> findByEmail(String email);

}
