package com.cook4u.model.reservation;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MapsId;
import javax.persistence.Table;

import com.cook4u.model.dish.DishEntity;
import com.cook4u.model.user.UserEntity;

import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
@Table(name = "reservation_dish")
public class ReservationDish implements Serializable  {

	public ReservationDish() {}

	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "reservation_dish_id")
    private Long id;
	
	@ManyToOne
    //@MapsId("reservationId") //This is the name of attr in ReservationDishPk class
    @JoinColumn(name = "reservation_id")
    private ReservationEntity reservation;

    @ManyToOne
    //@MapsId("dishId")
    @JoinColumn(name = "dish_id")
    private DishEntity dish;
    
    @Column(name="quantity")
    private int quantity;
}
