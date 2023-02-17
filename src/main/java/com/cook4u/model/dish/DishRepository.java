package com.cook4u.model.dish;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;

import com.cook4u.model.menu.MenuEntity;

public interface DishRepository extends JpaRepository<DishEntity, Long> {
	
	List<DishEntity> findAllByMenus(MenuEntity menu);
	List<DishEntity> findAllByMenusId(Long id);
}
