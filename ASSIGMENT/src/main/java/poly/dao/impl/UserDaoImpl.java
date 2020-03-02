package poly.dao.impl;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import poly.dao.UserDao;
import poly.model.Users;

@Repository
public class UserDaoImpl extends HibernateHelper implements UserDao{
	@Autowired
	SessionFactory sessionFactory;

	@Override
	@Transactional
	public Users findByUser(String username) {
		Session session = sessionFactory.getCurrentSession();
		return   session.get(Users.class, username);
	}

	@Override
	public boolean updateUser(Users user) {
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.update(user);
			t.commit();
			return true;
		} catch (Exception e) {
			t.rollback();
		}finally {
			session.close();
		}
		
		return false;
	}
	
}
