package com.hellokoding.auth.service;

import com.hellokoding.auth.model.User;

public interface UserService {
    void save(User user, String roleName);

    User findByUsername(String username);
}
