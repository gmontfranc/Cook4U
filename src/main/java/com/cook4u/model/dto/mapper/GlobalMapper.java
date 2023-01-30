package com.cook4u.model.dto.mapper;

import com.cook4u.model.auth.SignupRequest;
import com.cook4u.model.dto.SignupDto;
import com.cook4u.model.user.UserEntity;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Component;

@Component
public class GlobalMapper {

    private ModelMapper mapper;

    public GlobalMapper(ModelMapper mapper) {
        this.mapper = mapper;
    }

    public UserEntity convertToUserEntity(SignupDto signupRequest) {
        UserEntity user = mapper.map(signupRequest, UserEntity.class);
        user.setActive(true);
        return user;
    }
}
