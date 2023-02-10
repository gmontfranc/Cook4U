package com.cook4u.model.auth;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotNull;

@Getter
@Setter
@AllArgsConstructor
public class SignupRequest {

    @NotNull
    @Email
    @Length(min = 12, max = 50)
    private String email;
    @NotNull
    @Email
    @Length(min = 3, max = 50)
    private String firstname;
    @NotNull
    @Email
    @Length(min = 3, max = 50)
    private String lastname;

    @NotNull
    @Length(min = 6, max = 64)
    private String password;

    @NotNull
    @Length(min = 18)
    private int age;
}
