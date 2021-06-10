package com.ho.hwang.service;

import com.ho.hwang.vo.AccountVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.ho.hwang.mappers.UserMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AccountService implements UserDetailsService {
	
	private final UserMapper mapper;

	private PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();


	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		AccountVo user = mapper.selectUser(username);
		if(user==null) {
			throw new UsernameNotFoundException(username);
		}
		
		return user;
	}
	


	public void save(AccountVo account) {
		System.out.println("Encoding password");
		System.out.println(passwordEncoder);
		String pw = passwordEncoder.encode(account.getPassword());
		System.out.println("Account Service PW : "+ pw);
		account.setUserPw(passwordEncoder.encode(account.getPassword()));
		mapper.save(account);
		
	}



}
