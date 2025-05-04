import 'package:flutter/cupertino.dart';
import '../model/note.dart';

class NoteProvider extends ChangeNotifier
{
    final List<Note> _notes=[];

    List<Note> get notes=>_notes;

    void addNote(String title,String content){
      final note=Note(
        id:DateTime.now().toString(),
        title: title,
        content: content
      );

      _notes.add(note);
      notifyListeners();
    }

    void updateNote(String id,String title,String content){
      final index=_notes.indexWhere((note)=>note.id==id);
        if(index!=-1){
          _notes[index].title=title;
          _notes[index].content=content;
          notifyListeners();
        }
    }

    void deleteNote(String id){
      _notes.removeWhere((note)=>note.id==id);
      notifyListeners();
    }

}