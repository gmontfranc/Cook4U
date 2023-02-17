package com.cook4u.model.dto.mapper;

import com.cook4u.model.auth.SignupRequest;
import com.cook4u.model.dto.MenuDto;
import com.cook4u.model.dto.SignupDto;
import com.cook4u.model.dto.UserDto;
import com.cook4u.model.menu.MenuEntity;
import com.cook4u.model.user.UserEntity;
import org.apache.catalina.User;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
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
    
    public List<MenuDto> convertUMenuEntityToDto(Iterable<MenuEntity> iterable) {

    	List<MenuEntity> result = new ArrayList<>();
        iterable.forEach(result::add);

        return result
                .stream()
                .map(menu -> {
                    MenuDto menuDto = mapper.map(menu, MenuDto.class);
                    return menuDto;
                })
                .collect(Collectors.toList());
    }

    public UserDto convertUserEntityToDto(UserEntity user) {
        UserDto userDto = mapper.map(user, UserDto.class);
        userDto.setName(user.getFirstname()+ " "+user.getLastname());
        return userDto;
    }
}
