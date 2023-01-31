package com.cook4u.model.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
public class UserDto {

    public UserDto() {};
    private Long id;
    private int age;
    private String name;
    private String email;
    private String description;

}
