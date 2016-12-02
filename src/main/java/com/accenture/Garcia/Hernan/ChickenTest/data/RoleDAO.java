package com.accenture.Garcia.Hernan.ChickenTest.data;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.accenture.Garcia.Hernan.ChickenTest.model.Role;

public class RoleDAO {

	@Autowired
	SessionFactory sessionFactory;
	
	@Transactional
	public Role getRole(Long id) {
		Session session = sessionFactory.openSession();
		Role role = (Role) session.load(Role.class, id);
		session.close();
		return role;
	}
	
	@Transactional
	public Role getRoleByName(String roleName) {
		Session session = sessionFactory.openSession();
			Role role = (Role)session.createQuery("from Role where roleName=:name").setParameter("name", roleName).getSingleResult();
		session.close();
		return role;
	}
	
	
	public List<Role> listRole() {
		Session session = sessionFactory.openSession();
		List<Role> roleList = session.createQuery("from Role").getResultList();
		session.close();
		return roleList;
	}
	
	@Transactional
	public void addRole(Role role) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		session.save(role);
		tx.commit();
		session.close();
	}
	

	@Transactional
	public void updateRole(Role role) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		session.update(role);
		tx.commit();
		session.close();		
	}

	@Transactional
	public void deleteRole(long id) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		Role role = (Role) session.load(Role.class, id);
		session.delete(role);
		tx.commit();
		session.close();		
	}
	
	
	
}
