package com.ho.hwang.account;

import java.sql.Date;
import java.text.SimpleDateFormat;

import javax.security.sasl.AuthenticationException;
import javax.websocket.Session;

import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.WebAuthenticationDetails;
import org.springframework.stereotype.Service;

import com.ho.hwang.mappers.UserMapper;

import lombok.RequiredArgsConstructor;


@Service
@RequiredArgsConstructor
public class AccountService implements UserDetailsService {
	
	private final UserMapper mapper;

	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		Account user = mapper.selectUser(username);
		if(user==null) {
			throw new UsernameNotFoundException(username);
		}
		
		return user;
	}
	
	BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

	public void save(Account account) {
		String pw = passwordEncoder.encode(account.getPassword());
		account.setUser_pw(passwordEncoder.encode(account.getPassword()));
		System.out.println("Account Service PW : "+ pw);
		mapper.save(account);
		
	}


}
