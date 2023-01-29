package com.cook4u.model.menu;

import com.cook4u.model.dish.DishEntity;
import com.cook4u.model.user.UserEntity;
import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.Set;

@Getter
@Setter
@Entity
@Table(name = "\"Menus\"")
public class MenuEntity {

    public MenuEntity() {}

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "\"MenuId\"")
    private Long Id;

    @Column(name = "\"Description\"")
    private String description;

    @Column(name = "\"Name\"")
    private String name;

    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(name = "\"MenuDish\"", joinColumns = @JoinColumn(name = "\"MenuId\""), inverseJoinColumns = @JoinColumn(name = "\"DishId\""))
    private Set<DishEntity> dishes;

    @ManyToOne
    @JoinColumn(name = "\"UserId\"")
    @JsonIgnore
    private UserEntity user;
}
