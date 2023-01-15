package com.cook4u.model.role;

import com.cook4u.model.user.UserEntity;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Set;

@Entity
@Getter
@Setter
@Table(name = "\"Roles\"")
public class RoleEntity implements Serializable {
    public RoleEntity() {}
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "\"RoleId\"")
    private Long id;
    @Column(name = "\"Name\"")
    private String name;

    @JsonIgnore
    @OneToMany(mappedBy = "role", fetch = FetchType.LAZY)
    private Set<UserEntity> users;
}
