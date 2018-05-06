package com.licenta.flo.service;

public interface SecurityService {
    String findLoggedInUsername();

    void autologin(String username, String password);
}
