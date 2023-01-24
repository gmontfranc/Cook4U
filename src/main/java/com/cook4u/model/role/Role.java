package com.cook4u.model.role;

import lombok.ToString;


public enum Role {
    User("User"),
    Cook("Cook"),
    Admin("Admin");

    public String value;

     Role(String text) {
        this.value = text;
    }
}
