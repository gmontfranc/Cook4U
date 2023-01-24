package com.cook4u.service;

import com.cook4u.model.role.Role;
import com.cook4u.model.role.RoleEntity;

public interface RoleService {

    RoleEntity create(RoleEntity role);

    Iterable<RoleEntity> findAll();

    RoleEntity findByName(Role name);
}
