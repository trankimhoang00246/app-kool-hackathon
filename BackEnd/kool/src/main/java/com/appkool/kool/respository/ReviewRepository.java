package com.appkool.kool.respository;

import com.appkool.kool.entity.Review;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

@Repository
public interface ReviewRepository extends JpaRepository<Review, Long> {
}
