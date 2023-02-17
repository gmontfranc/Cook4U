package com.cook4u.service;

import java.util.List;

import com.cook4u.model.reservation.ReservationDish;
import com.cook4u.model.reservation.ReservationEntity;

public interface ReservationDishService {

	ReservationDish create(ReservationDish entity);
	Iterable<ReservationDish> findAll();
	List<ReservationDish> findByReservations(ReservationEntity reservation);
}
