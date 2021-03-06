package com.ho.hwang.vo;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.Set;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import lombok.Getter;
import lombok.Setter;


@SuppressWarnings("serial")
@Getter @Setter
public class AccountVo implements UserDetails{
	
	private String userId;
	private String userPw;
	private boolean enabled;
	private String authorityName;
	private int employeeId;

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		ArrayList<GrantedAuthority> auth = new ArrayList<GrantedAuthority>();
        auth.add(new SimpleGrantedAuthority(authorityName));
        return auth;
	}

	@Override
	public String getPassword() {
		// TODO Auto-generated method stub
		return userPw;
	}

	@Override
	public String getUsername() {
		// TODO Auto-generated method stub
		return userId;
	}

	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return enabled;
	}

	@Override
	public String toString() {
		return "AccountVo{" +
				"userId='" + userId + '\'' +
				", userPw='" + userPw + '\'' +
				", enabled=" + enabled +
				", authorityName='" + authorityName + '\'' +
				", employeeId=" + employeeId +
				'}';
	}
}
