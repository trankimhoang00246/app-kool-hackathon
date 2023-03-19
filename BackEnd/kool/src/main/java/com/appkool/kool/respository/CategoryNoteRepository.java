package com.appkool.kool.respository;

import com.appkool.kool.entity.CategoryNote;
import com.appkool.kool.entity.NoteDetail;
import com.appkool.kool.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CategoryNoteRepository extends JpaRepository<CategoryNote, Long> {

}
