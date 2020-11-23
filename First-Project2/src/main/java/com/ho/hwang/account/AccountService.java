package com.ho.hwang.account;

import lombok.AllArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.ho.hwang.mappers.UserMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AccountService implements UserDetailsService {
	
	private final UserMapper mapper;

	BCryptPasswordEncoder passwordEncoder;


	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		Account user = mapper.selectUser(username);
		if(user==null) {
			throw new UsernameNotFoundException(username);
		}
		
		return user;
	}
	


	public void save(Account account) {
		String pw = passwordEncoder.encode(account.getPassword());
		account.setUser_pw(passwordEncoder.encode(account.getPassword()));
		System.out.println("Account Service PW : "+ pw);
		mapper.save(account);
		
	}



}
