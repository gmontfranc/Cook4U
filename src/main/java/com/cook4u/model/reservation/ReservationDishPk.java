package com.cook4u.model.reservation;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class ReservationDishPk implements Serializable {
	
	@Column(name = "reservation_id")
    private Long reservationId;

	@Column(name = "dish_id")
    private Long dishId;

}
