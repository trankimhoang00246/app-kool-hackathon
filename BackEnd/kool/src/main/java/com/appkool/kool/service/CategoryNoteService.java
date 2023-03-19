package com.appkool.kool.service;

import com.appkool.kool.entity.CategoryNote;
import com.appkool.kool.entity.User;
import com.appkool.kool.respository.CategoryNoteRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class CategoryNoteService {
    @Autowired
    private CategoryNoteRepository categoryNoteRepository;

    public CategoryNote save(CategoryNote categoryNote) {
        return categoryNoteRepository.save(categoryNote);
    }

    public List<CategoryNote> listAllCategoryUser(User user) {
        List<CategoryNote> list = categoryNoteRepository.findAll();
        List<CategoryNote> l = new ArrayList<>();
        for (CategoryNote c:
                list) {
            if(c.getUser().getId().compareTo(user.getId())==0) {
                l.add(c);
            }
        }
        return l;
    }

    public CategoryNote checkTopicExistUser(String topic, User user) {

        List<CategoryNote> list = findAllByTopic(topic);
        if(list!=null) {
            for (CategoryNote c:
                    list) {
                if(c.getUser().getId().compareTo(user.getId())==0){
                    return c;
                }
            }
        }
        return null;
    }

    List<CategoryNote> findAllByTopic(String topic) {
        List<CategoryNote> list = categoryNoteRepository.findAll();
        List<CategoryNote> l = new ArrayList<>();
        for (CategoryNote c:
             list) {
            if(c.getTopic().equals(topic)) {
                l.add(c);
            }
        }
        return l;
    }

    public List<CategoryNote> listAll() {
        return categoryNoteRepository.findAll();
    }

    public void deleteById(Long idThuMuc) {
        categoryNoteRepository.deleteById(idThuMuc);
    }
}
