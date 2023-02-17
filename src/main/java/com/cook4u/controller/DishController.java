package com.cook4u.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.cook4u.model.auth.AuthResponse;
import com.cook4u.model.dish.DishDTO;
import com.cook4u.model.dish.DishEntity;
import com.cook4u.model.dish.DishRepository;
import com.cook4u.model.dto.MenuDto;
import com.cook4u.model.role.Role;
import com.cook4u.model.user.UserEntity;
import com.cook4u.security.configuration.JwtUtils;
import com.cook4u.service.UserService;

@RequestMapping("/api/dish")
@RestController
@CrossOrigin(origins = "http://localhost:4200")
public class DishController {

	@Autowired
	private DishRepository dishRepository;
	
	@Autowired
	private JwtUtils jwtUtil;
	
	@Autowired
	private UserService userService;
	
	@GetMapping("/menu/{id}")
	public List<DishEntity> getDishesForMenuById(@PathVariable Long id) {
		return dishRepository.findAllByMenusId(id);
	}
	
	@GetMapping("/all")
	public List<DishEntity> getDishes() {
		return dishRepository.findAll();
	}
	
	@PostMapping("/create")
	public ResponseEntity<?> createDish(@RequestBody @Valid DishEntity dish,
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
		
		DishEntity dishToSave = new DishEntity();
		dishToSave.setName(dish.getName());
		dishToSave.setDescription(dish.getDescription());
		dishToSave.setPrice(dish.getPrice());
		dishToSave.setType(dish.getType());
		dishRepository.save(dishToSave);
		
		response = new AuthResponse("Menu Successfully added");
    	return ResponseEntity.ok().body(response);
	}
}
