package com.cook4u.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.cook4u.model.auth.AuthResponse;
import com.cook4u.model.dish.DishDTO;
import com.cook4u.model.dish.DishEntity;
import com.cook4u.model.dish.DishType;
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

@RequestMapping("/api/reservations")
@RestController
@CrossOrigin(origins = "http://localhost:4200")
public class ReservationController {

	@Autowired
	private UserService userService;
	
	@Autowired
    private ReservationService reservationService;
    
	@Autowired
    private ReservationDishService reservationDishService;
	
	@Autowired
	private MenuService menuService;
	
	@Autowired
	private JwtUtils jwtUtil;

	

	
	@GetMapping("/user")
    public ResponseEntity<List<ReservationDTO>> getAll(@RequestHeader (name="Authorization") String token) {
		
		//get Current User
		token = token.substring(token.indexOf(" "));
		String subject = jwtUtil.getSubject(token);
		Long userId = Long.parseLong(subject.substring(0, subject.indexOf(',')));
		
		// switch case, if cook or user
		Boolean isCook = userService.findById(userId).get().getRole().getName().equals(Role.Cook);
		
		Iterable<ReservationEntity> userReservations = isCook?
				reservationService.findByCookId(userId) : reservationService.findByUserId(userId);
		
		List<ReservationDTO> resDTOs = new ArrayList<>();
		
		
		userReservations.forEach(res -> {
			ReservationDTO rDto= new ReservationDTO();

			int usId = isCook? res.getUser().getId().intValue() : res.getCook().getId().intValue();
			rDto.setId(res.getId().intValue());
			rDto.setCookId(usId);
			rDto.setState(res.getState());
			rDto.setAddress(res.getAddress());
			rDto.setComments(res.getAddress());
			rDto.setDate(res.getDate());
			rDto.setNumberOfPeople(res.getNbPersons());
			rDto.setPhoneNumber(Integer.parseInt(res.getPhoneNumber()));
			rDto.setPrixTotal(res.getTotalPrice().intValue());
			
			// set Dishes
			// starters :
			List<DishDTO> dishDtoStarter = new ArrayList<>();
			List<DishDTO> dishDtoMain = new ArrayList<>();
			List<DishDTO> dishDtoDessert = new ArrayList<>();
			
			List<ReservationDish> resDishs = reservationDishService.findByReservations(res);
			
			resDishs.forEach(rd -> {
				
				DishDTO dishD = new DishDTO(); 
				dishD.setName(rd.getDish().getName());
				dishD.setQuantity(rd.getQuantity());
				
				dishD.setPrice(rd.getDish().getPrice().intValue());
				if( rd.getDish().getType().equals(DishType.Starter)) {					
					dishDtoStarter.add(dishD);					
				} else if (rd.getDish().getType().equals(DishType.Main)) {
					dishDtoMain.add(dishD);
				} else if(rd.getDish().getType().equals(DishType.Dessert)) {
					dishDtoDessert.add(dishD);
				}
			});			
			rDto.setStarters(dishDtoStarter);
			rDto.setMainDishes(dishDtoMain);
			rDto.setDesserts(dishDtoDessert);
			
			resDTOs.add(rDto);
			
		});		
        return ResponseEntity.ok(resDTOs);
    }
	
	
	@PutMapping("/update")
	public ResponseEntity<?> updateReservationState(@RequestBody @Valid ReservationDTO reservation) {
		
		AuthResponse response = null;
		
        Integer updateState = reservationService.updateState((long) reservation.getId(), reservation.getState());
        
        if (updateState != null && updateState == 1) {
        	response = new AuthResponse("Reservation state updated successfully.");
            return ResponseEntity.status(HttpStatus.OK).body(response);
        }
        response = new AuthResponse("Reservation state not updated.");
        return ResponseEntity.status(HttpStatus.NO_CONTENT).body(response);
	}
	
	@PostMapping("/reserve")
    public ResponseEntity<?> reserverUser(@RequestBody @Valid ReservationDTO reservation,
    		@RequestHeader (name="Authorization") String token) {
    	
		
		//get Current User
		token = token.substring(token.indexOf(" "));
		String subject = jwtUtil.getSubject(token);
		String userId = subject.substring(0, subject.indexOf(','));
		UserEntity CurrentUser = userService.findById(Long.parseLong(userId)).get();
    	AuthResponse response = null;
    	System.out.println("entered here");
    	// get Cook by ID   	
    	Optional<UserEntity> userEntity = this.userService.findById((long) reservation.getCookId());
       if(userEntity.isEmpty()) {
        	response = new AuthResponse("Cook Not Found");
        	return ResponseEntity.status(HttpStatus.NOT_FOUND).body(response);
        }
        UserEntity cook = userEntity.get();
        
        // get meny By Id
        Optional<MenuEntity> menuOp = this.menuService.findMenu((long) reservation.getMenuId());
        if(menuOp.isEmpty())	{
        	response = new AuthResponse("Menu Not Found");
        	return ResponseEntity.status(HttpStatus.NOT_FOUND).body(response);
        }
        
        MenuEntity menu = menuOp.get();
        
        ReservationEntity resEntity = new ReservationEntity();
        
        // Add All Dishes
        List<DishEntity> dishes = new ArrayList<>();
        List<DishDTO> reservationDishes = new ArrayList<>();
        
        reservationDishes.addAll(reservation.getStarters());
        reservationDishes.addAll(reservation.getMainDishes());
        reservationDishes.addAll(reservation.getDesserts());
        resEntity.setUser(CurrentUser);
        resEntity.setCook(cook);
    	resEntity.setTotalPrice((double) reservation.getPrixTotal());
    	resEntity.setState(ReservationState.SUBMITTED);
    	resEntity.setPhoneNumber(reservation.getPhoneNumber()+ "");
    	resEntity.setNbPersons(reservation.getNumberOfPeople());
    	resEntity.setDate(reservation.getDate());
    	resEntity.setComments(reservation.getComments());
    	resEntity.setAddress(reservation.getAddress());
    	resEntity = reservationService.create(resEntity);
    	
    	// Add ReservationDish for each dish with quantity
    	for(DishDTO dishD : reservationDishes) {
        	// get Dish Id by name from menu
        	Optional<DishEntity> dop = menu.getDishes().stream().filter(m -> m.getName().equals(dishD.getName()))
        			.findFirst();
        	
        	if(dop.isEmpty()) {
        		return ResponseEntity.status(HttpStatus.NOT_FOUND)
        				.body("Dish with name: " + dishD.getName() + "does not exist!");
        	}
        	
        	DishEntity d = dop.get();
        	if ( dishD.getQuantity() > 0) {
        		ReservationDish rd = new ReservationDish();
            	rd.setDish(d);
            	rd.setReservation(resEntity);
            	rd.setQuantity(dishD.getQuantity());
            	reservationDishService.create(rd);
        	}
        	
        }
    	
    	response = new AuthResponse("Reservation Successfully added");
    	return ResponseEntity.ok().body(response);
    }
	
}
