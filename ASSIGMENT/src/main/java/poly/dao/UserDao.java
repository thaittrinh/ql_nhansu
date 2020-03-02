package poly.dao;

import poly.model.Users;

public interface UserDao {
	Users findByUser(String name);
	boolean updateUser(Users user);
}
