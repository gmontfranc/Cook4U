package com.cook4u.model.dto;

import java.util.List;

import com.cook4u.model.dish.DishEntity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
public class MenuDto {
	
	public MenuDto() {};
	
	private Long id;
    private String name;
    private String description;
    private List<DishEntity> dishes;

}
