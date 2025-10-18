package com.example.prodolymp.models.enums;

import org.springframework.security.core.GrantedAuthority;

public enum Role implements GrantedAuthority {
    user, admin;

    @Override
    public String getAuthority() {
        return name();
    }
}