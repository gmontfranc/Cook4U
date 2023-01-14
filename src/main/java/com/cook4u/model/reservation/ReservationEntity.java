package com.cook4u.model.reservation;

import com.cook4u.model.dish.DishEntity;
import com.cook4u.model.user.UserEntity;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.Date;
import java.util.Set;

@Entity
@Getter
@Setter
@Table(name = "\"Reservations\"")
public class ReservationEntity {

    public ReservationEntity() {}
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "\"ReservationId\"")
    private Long id;

    @Column(name = "\"Date\"")
    @Temporal(TemporalType.TIMESTAMP)
    private Date date;

    @Column(name = "\"Address\"")
    private String address;

    @Column(name = "\"PhoneNumber\"")
    private String phoneNumber;

    @Column(name = "\"State\"")
    @Enumerated(EnumType.STRING)
    private ReservationState state;

    @Column(name = "\"Comments\"")
    private String comments;

    @Column(name = "\"TotalPrice\"")
    private Double totalPrice;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "\"UserId\"")
    private UserEntity user;

    //TODO: MenuFK

    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(name = "\"ReservationDish\"", joinColumns = @JoinColumn(name = "\"ReservationId"), inverseJoinColumns = @JoinColumn(name = "\"DishId\""))
    private Set<DishEntity> reservationDishes;

}

