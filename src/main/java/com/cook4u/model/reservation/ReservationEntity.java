package com.cook4u.model.reservation;

import com.cook4u.model.dish.DishEntity;
import com.cook4u.model.user.UserEntity;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.Date;
import java.util.List;
import java.util.Set;

@Entity
@Getter
@Setter
@Table(name = "reservations")
public class ReservationEntity {

    public ReservationEntity() {}
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "reservation_id")
    private Long id;

    @Column(name = "date")
    @Temporal(TemporalType.TIMESTAMP)
    private Date date;

    @Column(name = "address")
    private String address;

    @Column(name = "phone_number")
    private String phoneNumber;

    @Column(name = "state")
    @Enumerated(EnumType.STRING)
    private ReservationState state;

    @Column(name = "comments")
    private String comments;

    @Column(name= "nb_persons")
    private int nbPersons;
    
    @Column(name = "total_price")
    private Double totalPrice;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    private UserEntity user;
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "cook_id")
    private UserEntity cook;
    
    

    //TODO: MenuFK

    @OneToMany(mappedBy = "reservation")
    private List<ReservationDish> reservationDishes;
//    @ManyToMany(fetch = FetchType.LAZY)
//    @JoinTable(name = "\"ReservationDish\"", joinColumns = @JoinColumn(name = "\"ReservationId"), inverseJoinColumns = @JoinColumn(name = "\"DishId\""))
//    private List<DishEntity> reservationDishes;

}

