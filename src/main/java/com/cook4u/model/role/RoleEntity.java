package com.cook4u.model.role;

import com.cook4u.model.user.UserEntity;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Set;

@Entity
@Table(name = "Roles")
public class RoleEntity implements Serializable {
    public RoleEntity() {}
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "\"Id\"")
    private Long id;
    @Column(name = "\"Name\"")
    private String name;

    @OneToMany(mappedBy = "role", fetch = FetchType.LAZY)
    private Set<UserEntity> users;
}
