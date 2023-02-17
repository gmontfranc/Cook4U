package com.cook4u.model.dish;

import com.cook4u.model.menu.MenuEntity;
import com.cook4u.model.reservation.ReservationDish;
import com.cook4u.model.reservation.ReservationEntity;
import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Getter;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;

import javax.persistence.*;

import java.util.List;
import java.util.Set;

@Entity
@Getter
@Setter
@Table(name = "dishes")
public class DishEntity {

    public DishEntity() {}

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "dish_id")
    private Long id;

    @Column(name = "description", columnDefinition="TEXT")
    private String description;

    @Column(name = "price")
    private Double price;

    @Column(name = "name")
    private String name;

    @Column(name = "type")
    @Enumerated(EnumType.STRING)
    private DishType type;

    @ManyToMany(mappedBy = "dishes", fetch = FetchType.LAZY)
    @JsonIgnore
    private Set<MenuEntity> menus;

    @OneToMany(mappedBy = "dish")
    @JsonIgnore
    private List<ReservationDish> reservationDishes;

}
