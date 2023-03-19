package com.appkool.kool.controller;

import com.appkool.kool.entity.Note;
import com.appkool.kool.entity.NoteDetail;
import com.appkool.kool.entity.Review;
import com.appkool.kool.service.CategoryNoteService;
import com.appkool.kool.service.NoteDetailService;
import com.appkool.kool.service.ReviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.time.Duration;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

@RestController
@RequestMapping("home/{iduser}/review")
public class ReviewController {
    @Autowired
    private ReviewService reviewService;
    @Autowired
    private NoteDetailService noteDetailService;

    //lấy ra list<notedetail> của 1 thư mục cần học hôm nay
    @GetMapping("{idcategory}/listallidnotedetail")
    public List<NoteDetail> listReviewToday(@PathVariable("iduser") Long idUser, @PathVariable("idcategory") Long idCategory) {
        List<NoteDetail> listNoteDetail = noteDetailService.listAllNoteDetailUser(idUser,idCategory);
        Collections.sort(listNoteDetail, new Comparator<NoteDetail>() {
            @Override
            public int compare(NoteDetail o1, NoteDetail o2) {
                return (int) (o2.getLevelPrioritize()-o1.getLevelPrioritize());
            }
        });

        LocalDateTime localDateTimeNow = LocalDateTime.now();
        List<NoteDetail> list = new ArrayList<NoteDetail>();

        if(listNoteDetail!=null) {
            for (NoteDetail n:
                 listNoteDetail) {
                List<LocalDateTime> temp = n.getReview().getListDate();
                for (LocalDateTime d:
                     temp) {
                    if(d.getYear()==localDateTimeNow.getYear()
                    && d.getMonthValue()==localDateTimeNow.getMonthValue()
                    && d.getDayOfMonth()==localDateTimeNow.getDayOfMonth()) {
                        list.add(n);
                    }
                }
            }
        }
        return list;
    }




    // Đây là phần cải tiến sau
//    // url home/1/review/idTopic/updatelevel/idreview
//    @PutMapping("{idTopic}/updatelevel/{idnotedetail}")
//    public void updateLevelPrioritize(@PathVariable("idnotedetail") Long idNoteDetail ,@RequestParam(value = "levelPrioritize", required = false) Long levelPrioritize) {
//        NoteDetail noteDetail = noteDetailService.findById(idNoteDetail);
//
//        //doi level
//        if(levelPrioritize.compareTo(noteDetail.getLevelPrioritize())==0) {
//            return;
//        }
//        noteDetail.setLevelPrioritize(levelPrioritize);
//
//        Review review = noteDetail.getReview();
//
//        Review temp = new Review(levelPrioritize);
//
//        review.setDateCreated(temp.getDateCreated());
//        review.setListDate(temp.getListDate());
//        review.setIncreaseFactor(temp.getIncreaseFactor());
//        review.setPercentMemorized(temp.getPercentMemorized());
//        review.setCountReview(0);
//        review.setListDateReviewed(temp.getListDateReviewed());
//
//        noteDetail.setReview(review);
//
//        //cap nhat lai not moi
//        noteDetailService.save(noteDetail);
//    }

//
//    //điều khiển đếm ôn tập
//    //mỗi lần hàm lấy 1 review từ id thì hàm này được gọi
//    public void updateDateManageReview(Long idNoteDetail) {
//        NoteDetail noteDetail = noteDetailService.findById(idNoteDetail);
//
//        LocalDateTime localDateTimeNow = LocalDateTime.now();
//
//        if(noteDetail!=null) {
//            Long days = Duration.between(noteDetail.getReview().getListDate().get(noteDetail.getReview().getCountReview()), localDateTimeNow).toDays();
//            if(noteDetail.getReview().getCountReview() < noteDetail.getReview().getListDate().size()) {
//                if(days.compareTo(0L)==0) {
//                    int countReview = noteDetail.getReview().getCountReview();
//                    if(noteDetail.getReview().getListDateReviewed().get(countReview)==null) {
//                        noteDetail.getReview().setCountReview(countReview+1);
//                        noteDetail.getReview().getListDateReviewed().add(localDateTimeNow);
//                        noteDetail.getReview().setPercentMemorized(noteDetail.getReview().getIncreaseFactor()+noteDetail.getReview().getPercentMemorized());
//                        noteDetailService.save(noteDetail);
//                    }
//                }
//            }
//        }
//    }
}
