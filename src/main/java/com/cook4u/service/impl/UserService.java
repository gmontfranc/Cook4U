package com.cook4u.service.impl;

import com.cook4u.model.user.UserEntity;

public interface UserService {

    UserEntity create(UserEntity user);

    Iterable<UserEntity> findAll();

}
