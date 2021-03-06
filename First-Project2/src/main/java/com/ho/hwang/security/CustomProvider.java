package com.ho.hwang.security;

import java.text.SimpleDateFormat;
import java.util.Date;

import com.ho.hwang.mappers.UserMapper;
import com.ho.hwang.vo.AccountVo;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.WebAuthenticationDetails;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;


@Service
@RequiredArgsConstructor
public class CustomProvider  implements AuthenticationProvider{


	
	private final UserDetailsService userdeser;
	private final UserMapper userMapper;
	
	BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
	
	private boolean matchPassword(String loginpw, String password) {
		return passwordEncoder.matches(loginpw, password);
	}

	@SuppressWarnings("unchecked")
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		
		//세션 관리
		WebAuthenticationDetails wad= null;
		String userIP = null;
		
		SimpleDateFormat fmt = new SimpleDateFormat( "yyyy-MM-dd HH:mm:ss");
		Date time = new Date();
		
		
		wad = (WebAuthenticationDetails) authentication.getDetails();
		userIP = wad.getRemoteAddress();
		
		System.out.println("userIP : "+ userIP);
		System.out.println("접속 시간 : " + fmt.format(time));
		
		
		//로그인 패스워드 검증
		String username = (String) authentication.getPrincipal();
		String password = (String) authentication.getCredentials();

		System.out.println("encodings: "+username+" "+password);
//		AccountVo user =(AccountVo) userdeser.loadUserByUsername(username);
		AccountVo user = userMapper.selectUser(username);

		if(!matchPassword(password, user.getPassword())){
			throw new BadCredentialsException(username);
		}
		if(!user.isEnabled()) {
			System.out.println("matchPassword");
			throw new BadCredentialsException(username);
		}
		
		UsernamePasswordAuthenticationToken result=new UsernamePasswordAuthenticationToken(username, password, user.getAuthorities());
	
		result.setDetails(user);
		return result;
		
	}

	@Override
	public boolean supports(Class<?> authentication) {
		// TODO Auto-generated method stub
		return (UsernamePasswordAuthenticationToken.class.isAssignableFrom(authentication));
	}
	

}
