package com.cook4u.model.user;

import com.cook4u.model.menu.MenuEntity;
import com.cook4u.model.reservation.ReservationEntity;
import com.cook4u.model.role.RoleEntity;
import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Set;


@Getter
@Setter
@Entity
@Table(name = "\"Users\"")
public class UserEntity implements Serializable {

    public UserEntity() {

    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "\"UserId\"")
    private Long id;

    @Column(name = "\"Age\"")
    private int age;
    @ManyToOne()
    @JsonIgnore
    @JoinColumn(name = "\"RoleId\"")
    private RoleEntity role;
    @Column(name = "\"Active\"")
    private boolean active;
    @Column(name = "\"Lastname\"")
    private String lastname;
    @Column(name = "\"Firstname\"")
    private String firstname;
    @Column(name = "\"Email\"")
    private String email;
    @Column(name = "\"Description\"")
    private String description;
    @Column(name = "\"Password\"")
    @JsonIgnore
    private String password;

    @OneToMany(mappedBy = "user", fetch = FetchType.LAZY)
    private Set<MenuEntity> menus;

    @OneToMany(mappedBy = "user", fetch = FetchType.LAZY)
    private Set<ReservationEntity> reservations;

    public RoleEntity getRole() {
        return role;
    }
}
