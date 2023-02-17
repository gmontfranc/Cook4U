package com.cook4u.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cook4u.model.reservation.ReservationDish;
import com.cook4u.model.reservation.ReservationDishRepository;
import com.cook4u.model.reservation.ReservationEntity;
import com.cook4u.service.ReservationDishService;

@Service
public class ReservationDishServiceImpl implements ReservationDishService {

	
	@Autowired
	private ReservationDishRepository reservationDishRepository;

	@Override
	@Transactional
	public ReservationDish create(ReservationDish entity) {
		
		return reservationDishRepository.save(entity);
	}

	@Override
	public Iterable<ReservationDish> findAll() {
		
		return reservationDishRepository.findAll();
	}

	@Override
	public List<ReservationDish> findByReservations(ReservationEntity reservation) {
		return reservationDishRepository.findByReservation(reservation);
	}
}
