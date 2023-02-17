package com.cook4u.model.dish;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class DishDTO {
	
	private String name;
    private int quantity;
    private int price;

}
