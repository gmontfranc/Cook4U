package com.cook4u.service.impl;

import com.cook4u.model.menu.MenuEntity;
import com.cook4u.model.menu.MenuRepository;
import com.cook4u.model.user.UserRepository;
import com.cook4u.service.MenuService;
import org.springframework.stereotype.Service;

@Service
public class MenuServiceImpl implements MenuService {

    private MenuRepository menuRepository;
    private UserRepository userRepository;

    public MenuServiceImpl(MenuRepository menuRepository, UserRepository userRepository) {
        this.menuRepository = menuRepository;
        this.userRepository = userRepository;
    }

    @Override
    public MenuEntity create(MenuEntity menu) {
        return menuRepository.save(menu);
    }

    @Override
    public Iterable<MenuEntity> getAll() {
        return menuRepository.findAll();
    }

    @Override
    public Iterable<MenuEntity> findByCookId(Long id) {
        return userRepository.findById(id).get().getMenus();
    }
}
