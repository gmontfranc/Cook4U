package com.cook4u.service.impl;

import com.cook4u.model.role.Role;
import com.cook4u.model.role.RoleEntity;
import com.cook4u.model.role.RoleRepository;
import com.cook4u.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RoleServiceImpl implements RoleService {


    private RoleRepository roleRepository;

    public RoleServiceImpl(RoleRepository roleRepository) {
        this.roleRepository = roleRepository;
    }

    @Override
    public RoleEntity create(RoleEntity role) {
        return roleRepository.save(role);
    }

    @Override
    public Iterable<RoleEntity> findAll() {
        return roleRepository.findAll();
    }

    @Override
    public RoleEntity findByName(Role name) {
        return roleRepository.findByName(name);
    }
}
