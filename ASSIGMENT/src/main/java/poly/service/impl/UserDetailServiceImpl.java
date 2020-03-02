package poly.service.impl;

import java.util.HashSet;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import poly.dao.UserDao;
import poly.model.Users;

@Service
public class UserDetailServiceImpl implements UserDetailsService {

	@Autowired
	UserDao userDao;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		
		//Kiểm tra tồn tại của user
		Users user = userDao.findByUser(username);
		if (user == null) {
			 throw new UsernameNotFoundException(username);
		}
		
		
		/*   // dành cho trường hợp có bảng role
		 * Set<GrantedAuthority> grantedAuthorities = new HashSet<>(); Set<Role> roles =
		 * user.getRoles(); for (Role role : roles) { grantedAuthorities.add(new
		 * SimpleGrantedAuthority(role.getName())); }
		 */
		Set<GrantedAuthority> grantedAuthorities = new HashSet<>();
			grantedAuthorities.add(new SimpleGrantedAuthority("ROLE_ADMIN"));
		
			///Trả vê cho user cho userdetail
		return new org.springframework.security.core.userdetails.User(
                user.getUsername(), user.getPassword(), grantedAuthorities);
	}

}
