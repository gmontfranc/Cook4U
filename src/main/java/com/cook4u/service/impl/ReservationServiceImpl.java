package com.cook4u.service.impl;

import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cook4u.model.reservation.ReservationEntity;
import com.cook4u.model.reservation.ReservationRepository;
import com.cook4u.model.reservation.ReservationState;
import com.cook4u.service.ReservationService;

@Service
public class ReservationServiceImpl implements ReservationService {

	@Autowired
	private ReservationRepository reservationRepository;
	
	
	@Override
	@Transactional
	public ReservationEntity create(ReservationEntity entity) {
		return reservationRepository.save(entity);
	}

	@Override
	public Optional<ReservationEntity> findReservationById(Long id) {
		return reservationRepository.findById(id);
	}

	@Override
	public Iterable<ReservationEntity> findAll() {
		return reservationRepository.findAll();
	}

	@Override
	public Iterable<ReservationEntity> findByUserId(Long id) {
		return reservationRepository.findByUserId(id);
	}

	@Override
	public Iterable<ReservationEntity> findByCookId(Long id) {
		return reservationRepository.findByCookId(id);
	}

	@Override
	public Integer updateState(Long id, ReservationState state) {
		return reservationRepository.updateState(id, state);
	}

}
