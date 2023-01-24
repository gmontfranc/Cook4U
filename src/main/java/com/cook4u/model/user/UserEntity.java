package com.cook4u.model.user;

import com.cook4u.model.menu.MenuEntity;
import com.cook4u.model.reservation.ReservationEntity;
import com.cook4u.model.role.RoleEntity;
import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.validator.constraints.Length;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;


import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Set;


@Getter
@Setter
@AllArgsConstructor
@Entity
@Table(name = "\"Users\"")
public class UserEntity implements Serializable, UserDetails {

    public UserEntity() {

    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "\"UserId\"")
    private Long id;

    @Column(name = "\"Age\"")
    private int age;
    @ManyToOne()
    @JoinColumn(name = "\"RoleId\"")
    private RoleEntity role;

    @Column(name = "\"Active\"")
    private boolean active;

    @Column(name = "\"Lastname\"", nullable = false)
    @NotNull
    @Length(min = 5, max = 128)
    private String lastname;

    @Column(name = "\"Firstname\"", nullable = false)
    @NotNull
    @Length(min = 5, max = 128)
    private String firstname;

    @Column(name = "\"Email\"", nullable = false, unique = true)
    private String email;

    @Column(name = "\"Description\"")
    private String description;

    @Column(name = "\"Password\"", nullable = false)
    @JsonIgnore
    private String password;

    @JsonIgnore
    @OneToMany(mappedBy = "user", fetch = FetchType.LAZY)
    private Set<MenuEntity> menus;

    @JsonIgnore
    @OneToMany(mappedBy = "user", fetch = FetchType.LAZY)
    private Set<ReservationEntity> reservations;

    public RoleEntity getRole() {
        return role;
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        List<GrantedAuthority> authorities = new ArrayList<>();
        authorities.add(new SimpleGrantedAuthority(getRole().getName().toString()));
        return authorities;
    }

    @Override
    public String getUsername() {
        return this.email;
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return this.active;
    }
}
