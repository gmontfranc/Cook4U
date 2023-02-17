package com.cook4u.model.reservation;

import java.util.Date;
import java.util.List;

import com.cook4u.model.dish.DishDTO;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class ReservationDTO {

	private int id;
	
	private int cookId;
	
	private int menuId;
	
	private Date date;
	
	private int numberOfPeople;
	
	private String address;
	
	private int phoneNumber;
	
	private String comments;
	
	private ReservationState state;
	
	private List<DishDTO> starters;
	
	private List<DishDTO> mainDishes;
	
	private List<DishDTO> desserts;
	
	private int prixTotal;	
	
}
