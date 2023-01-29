package com.cook4u.controller;

import com.cook4u.model.menu.MenuEntity;
import com.cook4u.service.MenuService;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RequestMapping("/api/menu")
@RestController
public class MenuController {

    private MenuService menuService;

    public MenuController(MenuService menuService) {
        this.menuService = menuService;
    }

    @GetMapping("/")
    public Iterable<MenuEntity> getAll() {
        return menuService.getAll();
    }

    @GetMapping("/cook/{id}")
    public Iterable<MenuEntity> getAllForCookById(@PathVariable Long id) {
        return menuService.findByCookId(id);
    }

}
