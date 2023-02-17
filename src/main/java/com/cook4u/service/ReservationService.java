package com.cook4u.service;

import java.util.Optional;

import com.cook4u.model.reservation.ReservationEntity;
import com.cook4u.model.reservation.ReservationState;

public interface ReservationService {

	ReservationEntity create(ReservationEntity entity);
	Optional<ReservationEntity> findReservationById(Long id);
	Iterable<ReservationEntity> findAll();
	Iterable<ReservationEntity> findByUserId(Long id); 
	Iterable<ReservationEntity> findByCookId(Long id);
	Integer updateState(Long id, ReservationState state);
}
