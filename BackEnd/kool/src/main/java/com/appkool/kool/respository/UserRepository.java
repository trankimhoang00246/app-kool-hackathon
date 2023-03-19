package com.appkool.kool.respository;

import com.appkool.kool.entity.User;
import jakarta.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
@Transactional
public interface UserRepository extends JpaRepository<User, Long> {
    Optional<User> findById(Long id);
    User getUserByEmail(String email);
    User findUserByEmail(String email);

    User getUserByUserName(String userName);

    User findUserByUserName(String username);


}
