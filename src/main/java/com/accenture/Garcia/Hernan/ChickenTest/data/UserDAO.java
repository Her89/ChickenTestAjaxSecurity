package com.accenture.Garcia.Hernan.ChickenTest.data;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.transaction.annotation.Transactional;

import com.accenture.Garcia.Hernan.ChickenTest.model.User;


public class UserDAO {

	@Autowired
   BCryptPasswordEncoder bCryptPasswordEncoder;
	@Autowired
	SessionFactory sessionFactory;
	
	@Transactional
	public User getUser(Long id) {
		Session session = sessionFactory.openSession();
		User user = (User) session.load(User.class, id);
		session.close();
		return user;
	}
	
	public List<User> listUser() {
		Session session = sessionFactory.openSession();
		List<User> userList = session.createQuery("from User").getResultList();
		session.close();
		return userList;
	}
	
	@Transactional
	public void addUser(User user) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
		session.save(user);
		tx.commit();
		session.close();
	}
	

	@Transactional
	public void updateUser(User user) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		session.update(user);
		tx.commit();
		session.close();		
	}

	@Transactional
	public void deleteUser(long id) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		User user = (User) session.load(User.class, id);
		session.delete(user);
		tx.commit();
		session.close();		
	}

	
	
}
