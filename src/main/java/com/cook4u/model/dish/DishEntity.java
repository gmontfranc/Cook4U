package com.cook4u.model.dish;

import com.cook4u.model.menu.MenuEntity;
import com.cook4u.model.reservation.ReservationEntity;
import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Getter;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;

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
    @JsonIgnore
    private Set<MenuEntity> menus;

    @ManyToMany(mappedBy = "reservationDishes", fetch = FetchType.LAZY)
    @JsonIgnore
    private Set<ReservationEntity> reservations;

}
