package com.cook4u.model.user;

import com.cook4u.model.role.Role;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<UserEntity, Long> {

    Optional<UserEntity> findByEmail(String email);

    Optional <UserEntity> findById(Long id);
    List<UserEntity> findAllByRoleName(Role name);
}
