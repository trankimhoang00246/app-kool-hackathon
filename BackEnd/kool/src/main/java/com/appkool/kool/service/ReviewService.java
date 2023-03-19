package com.appkool.kool.service;

import com.appkool.kool.dto.ReviewDto;
import com.appkool.kool.entity.NoteDetail;
import com.appkool.kool.entity.Review;
import com.appkool.kool.respository.ReviewRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.Duration;
import java.time.LocalDateTime;
import java.util.*;

@Service
public class ReviewService {
    @Autowired
    ReviewRepository reviewRepository;

    public Review save(ReviewDto reviewDto) {
        Review review = new Review(reviewDto.getLevelPrioritize());
        return reviewRepository.save(review);
    }
    public Review save(Review review) {
        return reviewRepository.save(review);
    }

    //tim theo id
    public Optional<Review> findById(Long id) {
        return reviewRepository.findById(id);
    }

    //xoa review theo id
    public Boolean deleteById(Long id) {
        Review review = reviewRepository.findById(id).get();
        if(review!=null) {
            reviewRepository.deleteById(id);
            return true;
        }
        return false;
    }

}
