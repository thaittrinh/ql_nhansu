package poly.service;

import poly.model.Users;

public interface UserService {
	Users findByName(String username);
	boolean updateUser(Users user);
}
