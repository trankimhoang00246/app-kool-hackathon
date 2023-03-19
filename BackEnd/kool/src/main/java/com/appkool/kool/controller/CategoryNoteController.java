package com.appkool.kool.controller;

import com.appkool.kool.dto.CategoryNoteDto;
import com.appkool.kool.entity.CategoryNote;
import com.appkool.kool.entity.User;
import com.appkool.kool.respository.CategoryNoteRepository;
import com.appkool.kool.service.CategoryNoteService;
import com.appkool.kool.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("home/{iduser}/note")
public class CategoryNoteController {
    @Autowired
    private CategoryNoteService categoryNoteService;
    @Autowired
    private UserService userService;

    @PostMapping("savecategory")
    public CategoryNote save(@PathVariable("iduser") Long idUser,@RequestBody CategoryNoteDto categoryNoteDto) {
        Optional<User> user = userService.getUserById(idUser);
        if(categoryNoteService.checkTopicExistUser(categoryNoteDto.getTopic(), user.get())==null) {
            CategoryNote categoryNote =new CategoryNote(categoryNoteDto.getTopic(), user.get());
            return categoryNoteService.save(categoryNote);
        }
        return null;
    }

    //list category user
    @GetMapping("listallcategoryluser")
    public List<CategoryNote> listAllCategoryUser(@RequestBody User user) {
        return categoryNoteService.listAllCategoryUser(user);
    }
}
