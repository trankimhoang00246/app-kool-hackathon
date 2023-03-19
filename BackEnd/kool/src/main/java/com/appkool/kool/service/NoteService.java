package com.appkool.kool.service;

import com.appkool.kool.entity.Note;
import com.appkool.kool.entity.NoteDetail;
import com.appkool.kool.entity.User;
import com.appkool.kool.respository.NoteDetailRepository;
import com.appkool.kool.respository.NoteRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class NoteService {
    @Autowired
    NoteRepository noteRepository;
    @Autowired
    NoteDetailRepository noteDetailRepository;

    public Note save(Note note) {
        return noteRepository.save(note);
    }

    public Optional<Note> findNoteById(Long id) {
        return noteRepository.findById(id);
    }

    public void deleteNoteById(Long id) {
        noteRepository.deleteById(id);
    }

    //của iduser header note
    public Boolean checkHeaderNoteExist(String header, Long idUser) {
        List<NoteDetail> list = noteDetailRepository.findAll();
        if(list!=null) {
            for (NoteDetail n:
                 list) {
                if(n.getUser().getId().compareTo(idUser)==0) {
                    if(n.getNote().getTitle().equals(header)) {
                        return false;
                    }
                }
            }
        }
        return true;
    }
}
