package com.cook4u.service;

import com.cook4u.model.role.RoleEntity;

public interface RoleService {

    RoleEntity create(RoleEntity role);

    Iterable<RoleEntity> findAll();
}
