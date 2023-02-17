package com.cook4u.model.reservation;

import java.util.List;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public interface ReservationRepository extends CrudRepository<ReservationEntity, Long> {
	
	Iterable<ReservationEntity> findByUserId(Long id); 
	Iterable<ReservationEntity> findByCookId(Long id);
	
	@Transactional
    @Modifying
    @Query("UPDATE ReservationEntity SET state = ?2 WHERE id = ?1")
	Integer updateState(Long id, ReservationState state);
}

