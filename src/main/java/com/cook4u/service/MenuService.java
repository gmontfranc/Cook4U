package com.cook4u.service;

import com.cook4u.model.menu.MenuEntity;

public interface MenuService {

    MenuEntity create(MenuEntity menu);
    Iterable<MenuEntity> getAll();
    Iterable<MenuEntity> findByCookId(Long id);
}
