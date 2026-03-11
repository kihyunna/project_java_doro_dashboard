package com.miniproject.common.users.repository;

import java.util.List;

import org.springframework.data.querydsl.QuerydslPredicateExecutor;
import org.springframework.data.repository.CrudRepository;

import com.miniproject.common.users.domain.Users;
import com.miniproject.common.users.domain.QUsers;
import com.querydsl.core.BooleanBuilder;
import com.querydsl.core.types.Predicate;

public interface UsersRepo extends CrudRepository<Users, Long>, QuerydslPredicateExecutor<Users> {

	public List<Users> findAll();
	
	//public Users findByUserIdAndPassword(String userId, String password);
		
	public default Predicate makePredicate(String type, String keyword) {

		QUsers users = QUsers.users;

		BooleanBuilder builder = new BooleanBuilder();
		builder.and(users.used.gt(1));

		if (type == null)
			return builder;
		
		switch (type) {
		case "name":
			builder.and(users.user_nm.contains(keyword));
			break;
		case "userid":
			builder.and(users.userId.contains(keyword));
			break;		
		}

		return builder;
	}
}
