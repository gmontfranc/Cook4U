package com.cook4u.model.dish;

import com.cook4u.model.menu.MenuEntity;
import com.cook4u.model.reservation.ReservationEntity;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.Set;

@Entity
@Getter
@Setter
@Table(name = "\"Dishes\"")
public class DishEntity {

    public DishEntity() {}

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "\"DishId\"")
    private Long id;

    @Column(name = "\"Description\"")
    private String description;

    @Column(name = "\"Price\"")
    private Double price;

    @Column(name = "\"Name\"")
    private String name;

    @Column(name = "\"Type\"")
    @Enumerated(EnumType.STRING)
    private DishType type;

    @ManyToMany(mappedBy = "dishes", fetch = FetchType.LAZY)
    private Set<MenuEntity> menus;

    @ManyToMany(mappedBy = "reservationDishes", fetch = FetchType.LAZY)
    private Set<ReservationEntity> reservations;

}
