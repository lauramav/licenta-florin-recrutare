package com.licenta.flo.service;

import com.licenta.flo.model.User;

public interface UserService {
    void save(User user, String roleName);

    User findByUsername(String username);
}
