package com.appkool.kool.service;

import com.appkool.kool.dto.NoteDetailDto;
import com.appkool.kool.entity.CategoryNote;
import com.appkool.kool.entity.Note;
import com.appkool.kool.entity.NoteDetail;
import com.appkool.kool.entity.User;
import com.appkool.kool.respository.NoteDetailRepository;
import com.appkool.kool.respository.NoteRepository;
import com.appkool.kool.respository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class NoteDetailService {
    @Autowired
    private NoteRepository noteRepository;
    @Autowired
    private NoteDetailRepository noteDetailRepository;
    @Autowired
    private UserRepository userRepository;

    public NoteDetail findById(Long idNoteDetail) {
        return noteDetailRepository.findById(idNoteDetail).get();
    }

    public List<NoteDetail> listAllNoteDetailUser(Long iduser, Long idthumuc) {
        List<NoteDetail> listAll = listAllNoteDetail(iduser);
        List<NoteDetail> list = new ArrayList<NoteDetail>();
        for (NoteDetail e: listAll) {
            if (e.getCategory().getId().compareTo(idthumuc)==0)
                list.add(e);
        }
        return list;
    }

    public NoteDetail save(NoteDetail noteDetail) {
        noteRepository.save(noteDetail.getNote());
        return noteDetailRepository.save(noteDetail);
    }


    public void deleteNoteDetailByIdNoteDetail(Long id) {
        Optional<NoteDetail> n = noteDetailRepository.findById(id);
        //noteRepository.deleteById(n.get().getId());
        noteDetailRepository.deleteById(id);
    }

    public List<NoteDetail> listAllNoteDetail(Long idUser) {
        List<NoteDetail> listNoteDetail = noteDetailRepository.findAll();
        List<NoteDetail> list = new ArrayList<NoteDetail>();

        for (NoteDetail e: listNoteDetail) {
            if (e.getUser().getId().compareTo(idUser)==0)
                list.add(e);
        }
        return list;
    }

    public NoteDetail getNoteDetailOfUser(Long idUser, Long id) {
        List<NoteDetail> listNoteDetail = noteDetailRepository.findAll();

        for (NoteDetail e : listNoteDetail) {
            if (e.getUser().getId().compareTo(idUser) == 0 && e.getId()==id) {
                return e;
            }
        }
        return  null;
    }

    public List<NoteDetail> findAll() {
        return noteDetailRepository.findAll();
    }
}
