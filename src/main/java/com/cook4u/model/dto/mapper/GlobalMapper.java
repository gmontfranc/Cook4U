package com.cook4u.model.dto.mapper;

import com.cook4u.model.auth.SignupRequest;
import com.cook4u.model.dto.SignupDto;
import com.cook4u.model.dto.UserDto;
import com.cook4u.model.user.UserEntity;
import org.apache.catalina.User;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.stream.Collectors;

@Component
public class GlobalMapper {

    private ModelMapper mapper;

    public GlobalMapper(ModelMapper mapper) {
        this.mapper = mapper;
    }

    public UserEntity convertSignupRequestToUserEntity(SignupDto signupRequest) {
        UserEntity user = mapper.map(signupRequest, UserEntity.class);
        user.setActive(true);
        return user;
    }

    public List<UserDto> convertUserEntityToDto(List<UserEntity> users) {

        return users
                .stream()
                .map(user -> {
                    UserDto userDto = mapper.map(user, UserDto.class);
                    userDto.setName(user.getFirstname()+ " "+user.getLastname());
                    return userDto;
                })
                .collect(Collectors.toList());
    }
}
