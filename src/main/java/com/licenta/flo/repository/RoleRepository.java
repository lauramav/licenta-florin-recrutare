package com.licenta.flo.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.licenta.flo.model.Role;

public interface RoleRepository extends JpaRepository<Role, Long>{
	Role findByName(String name);
}
