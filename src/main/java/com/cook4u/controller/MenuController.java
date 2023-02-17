package com.cook4u.controller;

import com.cook4u.model.auth.AuthResponse;
import com.cook4u.model.dish.DishDTO;
import com.cook4u.model.dish.DishEntity;
import com.cook4u.model.dto.MenuDto;
import com.cook4u.model.menu.MenuEntity;
import com.cook4u.model.reservation.ReservationDTO;
import com.cook4u.model.reservation.ReservationDish;
import com.cook4u.model.reservation.ReservationEntity;
import com.cook4u.model.reservation.ReservationState;
import com.cook4u.model.role.Role;
import com.cook4u.model.user.UserEntity;
import com.cook4u.security.configuration.JwtUtils;
import com.cook4u.service.MenuService;
import com.cook4u.service.ReservationDishService;
import com.cook4u.service.ReservationService;
import com.cook4u.service.UserService;

import org.aspectj.weaver.ast.Or;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Optional;
import java.util.Set;

import javax.validation.Valid;

@RequestMapping("/api/menu")
@RestController
@CrossOrigin(origins = "http://localhost:4200")
public class MenuController {

	private final MenuService menuService;
	
	@Autowired
	private JwtUtils jwtUtil;
	
	@Autowired
	private UserService userService;

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

	@PostMapping("/create")
	public ResponseEntity<?> createMenu(@RequestBody @Valid MenuDto menuDto,
			@RequestHeader(name = "Authorization") String token) {

		AuthResponse response = null;
		// get Current User
		token = token.substring(token.indexOf(" "));
		String subject = jwtUtil.getSubject(token);
		String userId = subject.substring(0, subject.indexOf(','));
		UserEntity currentUser = userService.findById(Long.parseLong(userId)).get();
		
		if(!currentUser.getRole().getName().equals(Role.Cook)) {
			response = new AuthResponse("Cook Not Found");
        	return ResponseEntity.status(HttpStatus.NOT_FOUND).body(response);
		}
		
		Set<DishEntity>  dishes = new HashSet<>();
		dishes.addAll(menuDto.getDishes());
		
		MenuEntity menu = new MenuEntity();
		
		menu.setName(menuDto.getName());
		menu.setDescription(menuDto.getDescription());
		menu.setUser(currentUser);
		menu.setDishes(dishes);
		
		menuService.create(menu);
		
		response = new AuthResponse("Menu Successfully added");
    	return ResponseEntity.ok().body(response);
	}

}
