package com.cook4u.service;

import com.cook4u.model.role.Role;
import com.cook4u.model.user.UserEntity;

import java.util.List;
import java.util.Optional;

public interface UserService {

    UserEntity create(UserEntity user);

    Iterable<UserEntity> findAll();


    Optional<UserEntity> findById(Long id);
    Optional<UserEntity> findByEmail(String email);

    List<UserEntity> findAllByRoleName(Role name);

}
