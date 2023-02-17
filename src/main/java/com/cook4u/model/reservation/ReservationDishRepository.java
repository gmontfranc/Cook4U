package com.cook4u.model.reservation;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ReservationDishRepository extends JpaRepository<ReservationDish, Long> {

	List<ReservationDish> findByReservation(ReservationEntity reservation);
}
