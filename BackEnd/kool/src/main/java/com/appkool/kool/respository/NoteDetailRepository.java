package com.appkool.kool.respository;

import com.appkool.kool.entity.NoteDetail;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface NoteDetailRepository extends JpaRepository<NoteDetail, Long> {
    Optional<NoteDetail> findById(Long id);

    void deleteById(Integer id);
}
