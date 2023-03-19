package com.appkool.kool.controller;

import com.appkool.kool.dto.NoteDetailDto;
import com.appkool.kool.entity.*;
import com.appkool.kool.respository.CategoryNoteRepository;
import com.appkool.kool.respository.NoteRepository;
import com.appkool.kool.service.*;
import jakarta.persistence.criteria.CriteriaBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.security.GeneralSecurityException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.Set;

@RestController
@RequestMapping("home/{iduser}/note")
public class NoteDetailController {
    @Autowired
    private NoteDetailService noteDetailService;
    @Autowired
    private UserService userService;
    @Autowired
    private NoteService noteService;
    @Autowired
    private CategoryNoteService categoryNoteService;
    @Autowired
    private ReviewService reviewService;
    @Autowired
    private EventCalendarService eventCalendarService;

    //lấy ra tất cả các notedetail của user
    @GetMapping("listallnotedetail")
    public List<NoteDetail> listAllNoteDetail(@PathVariable("iduser") Long id) {
        return noteDetailService.listAllNoteDetail(id);
    }

    //lấy ra các notedetail của 1 thư mục, chủ đề riêng
    @GetMapping("listallnotedetailuser/{idthumuc}")
    public List<NoteDetail> noteDetailuser(@PathVariable("iduser") Long iduser,@PathVariable("idthumuc") Long idthumuc) {
        return noteDetailService.listAllNoteDetailUser(iduser, idthumuc);
    }

    //lấy ra 1 notedetail của 1 thư mục
    @GetMapping("/{idthumuc}/notedetail/{idnote}")
    public NoteDetail getNoteDetailOfUser(@PathVariable("iduser") Long idUser, @PathVariable("idthumuc") Long idThuMuc, @PathVariable("idnote") Long idNote) {
        return noteDetailService.getNoteDetailOfUser(idUser, idNote);
    }

    //sửa 1 note
    @PutMapping("{idthumuc}/notedetail/{idnote}/update")
    public NoteDetail updateNoteDetailOfUser(@PathVariable("iduser") Long idUser, @PathVariable("idthumuc") Long idThuMuc, @PathVariable("idnote") Long idNote, @RequestBody NoteDetailDto noteDetailDto) {
        List<NoteDetail> listNoteDetail = noteDetailService.findAll();
        Optional<User> user = userService.getUserById(idUser);

        for (NoteDetail e : listNoteDetail) {
            if (e.getUser().getId().compareTo(idUser) == 0 && e.getNote().getId()==idNote) {
                CategoryNote categoryNote = categoryNoteService.checkTopicExistUser(noteDetailDto.getTopic(), user.get());
                if(categoryNote==null) {
                    CategoryNote temp = new CategoryNote(noteDetailDto.getTopic(), user.get());
                    categoryNote=temp;
                    categoryNoteService.save(categoryNote);
                    e.setCategory(categoryNote);
                }
                e.getNote().setTitle(noteDetailDto.getHeader());
                e.getNote().setContentNote(noteDetailDto.getContentNote());
                noteService.save(e.getNote());
                return noteDetailService.save(e);
            }
        }
        return null;
    }

    //luu 1 note mới của 1 thư mục đã có hoặc chưa có
    @PostMapping("savenote")
    public NoteDetail saveNoteDetail(@PathVariable("iduser") Long idUser , @RequestBody NoteDetailDto noteDetailDto) throws GeneralSecurityException, IOException {
        //tao bien user
        Optional<User> user = userService.getUserById(idUser);

        //kiem tra tieu de note co tôồn tại chưa
        if(noteService.checkHeaderNoteExist(noteDetailDto.getHeader(), idUser)==false) {
            return null;
        }

        //tao bien note
        Note note = new Note(noteDetailDto.getHeader(), noteDetailDto.getContentNote());
        noteService.save(note);

        //tim kiem xem topic da ton hay chua chua thi tao mot category moi
        if(categoryNoteService.checkTopicExistUser(noteDetailDto.getTopic(), user.get())==null) {
            CategoryNote categoryNote = new CategoryNote(noteDetailDto.getTopic(), user.get());
            categoryNoteService.save(categoryNote);

            //tạo 1 Review
            Review review = new Review(noteDetailDto.getLevel());

            NoteDetail noteDetail = new  NoteDetail(categoryNote, noteDetailDto.getLevel(), user.get(), note, reviewService.save(review));
            NoteDetail save = noteDetailService.save(noteDetail);

            //có danh sánh ngày cần học
            eventCalendarService.createDateReview(noteDetail.getReview().getListDate(), noteDetail.getNote().getTitle(), noteDetail.getCategory().getTopic(), noteDetail.getUser().getEmail());

            return save;
        } else {
            //tạo 1 Review
            Review review = new Review(noteDetailDto.getLevel());

            CategoryNote categoryNote = categoryNoteService.checkTopicExistUser(noteDetailDto.getTopic(), user.get());
            NoteDetail noteDetail = new  NoteDetail(categoryNote, noteDetailDto.getLevel(), user.get(), note, reviewService.save(review));
            NoteDetail save = noteDetailService.save(noteDetail);

            //có danh sánh ngày cần học
            eventCalendarService.createDateReview(noteDetail.getReview().getListDate(), noteDetail.getNote().getTitle(), noteDetail.getCategory().getTopic(), noteDetail.getUser().getEmail());

            return save;
        }
    }

    //xóa thư mục -> xóa tất cả các note trong thư mục
    @DeleteMapping("deletecategory/{idthumuc}")
    public void deleteCategory(@PathVariable("iduser") Long iduser,@PathVariable("idthumuc") Long idThuMuc) {
        List<NoteDetail> listAll = noteDetailService.listAllNoteDetail(iduser);
        if(listAll!=null) {
            for (NoteDetail e: listAll) {
                if (e.getCategory().getId().compareTo(idThuMuc)==0) {
                    Long idReview = e.getReview().getId();
                    noteDetailService.deleteNoteDetailByIdNoteDetail(e.getId());
                    noteService.deleteNoteById(e.getNote().getId());
                    reviewService.deleteById(idReview);
                }
            }
        }
        categoryNoteService.deleteById(idThuMuc);
    }

    //xóa 1 note trong thư mục cụ thể
    @DeleteMapping("/{idthumuc}/deletenote/{idnote}")
    public void deleteCategory(@PathVariable("iduser") Long iduser,@PathVariable("idthumuc") Long idThuMuc, @PathVariable("idnote") Long idNote) {
        List<NoteDetail> listAll = noteDetailService.listAllNoteDetail(iduser);
        if(listAll!=null) {
            for (NoteDetail e: listAll) {
                if (e.getCategory().getId().compareTo(idThuMuc)==0 && e.getNote().getId().compareTo(idNote)==0) {
                    Long idReview = e.getReview().getId();
                    noteDetailService.deleteNoteDetailByIdNoteDetail(e.getId());
                    noteService.deleteNoteById(e.getNote().getId());
                    reviewService.deleteById(idReview);
                    break;
                }
            }
        }
    }
}
