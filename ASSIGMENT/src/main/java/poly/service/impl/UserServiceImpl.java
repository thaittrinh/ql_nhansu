package poly.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import poly.dao.UserDao;
import poly.dao.impl.HibernateHelper;
import poly.model.Users;
import poly.service.UserService;

@Service
public class UserServiceImpl extends HibernateHelper implements UserService{
@Autowired
UserDao userDao;
	@Override
	public Users findByName(String username) {
		
		return userDao.findByUser(username);
	}
	@Override
	public boolean updateUser(Users user) {
		
		return userDao.updateUser(user);
	}

}
