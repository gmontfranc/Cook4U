package com.cook4u.model.reservation;

import org.springframework.stereotype.Service;

@Service
public enum ReservationState {
    SUBMITTED,
    IN_PROGRESS,
    COMPLETED
}
