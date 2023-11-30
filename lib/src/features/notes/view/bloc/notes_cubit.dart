import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:g_notes/src/features/notes/domain/entities/note.dart';
import 'package:g_notes/src/features/notes/domain/usecases/note_usecases.dart';
import 'package:meta/meta.dart';

part 'note_state.dart';

class NotesCubit extends Cubit<NotesState> {
  final NoteUseCases _useCaseCollection;
  final int _notesPerPage = 4;

  late List<NoteEntity?> _allNotes;
  late int _page = 0;
  late int _notesCount = 0;

  NotesCubit(this._useCaseCollection) : super(const NoteInitial());

  void getNotes() async {
    emit(const NoteLoading());
    try {
      _allNotes = await _useCaseCollection.getNotes();
      _notesCount = _allNotes.length;

      /*
      int start = _page * _notesPerPage;
      int checkEnd = (_page * _notesPerPage) + _notesPerPage;
      int end = checkEnd > _notesCount ? _notesCount : checkEnd;

      var notesList = _allNotes.sublist(start, end);
      */

      if (_allNotes.isEmpty) {
        emit(const NoteEmpty());
      }else{
        //emit(const NoteEmpty());
        emit(NoteDone(notes: _allNotes));
      }
    } catch (e) {
      emit(NoteError(message: e.toString()));
    }
  }

  void createNote(NoteEntity note) async{
    emit(const NoteLoading());
    try{
      await _useCaseCollection.createNote(
        params: note,
      );
      _allNotes = await _useCaseCollection.getNotes();
      _notesCount = _allNotes.length;

      emit(const NotePaginationRefresh());
      if (_allNotes.isEmpty) {
        emit(const NoteEmpty());
      }else{
        //emit(const NoteEmpty());
        emit(NoteDone(notes: _allNotes));
      }
    }
    catch(e){
      emit(NoteError(message: e.toString()));
    }
  }

  void updateNote(NoteEntity note) async{
    emit(const NoteLoading());
    try{
      await _useCaseCollection.updateNote(
        params: note,
      );
      _allNotes = await _useCaseCollection.getNotes();
      _notesCount = _allNotes.length;

      if (_allNotes.isEmpty) {
        emit(const NoteEmpty());
      }else{
        //emit(const NoteEmpty());
        emit(NoteDone(notes: _allNotes));
      }
    }
    catch(e){
      emit(NoteError(message: e.toString()));
    }
  }

  void deleteNote(String id) async{
    emit(const NoteLoading());
    try{
      await _useCaseCollection.deleteNote(
        params: id,
      );
      _allNotes = await _useCaseCollection.getNotes();
      _notesCount = _allNotes.length;

      emit(const NotePaginationRefresh());

      if (_allNotes.isEmpty) {
        emit(const NoteEmpty());
      }else{
        //emit(const NoteEmpty());
        emit(NoteDone(notes: _allNotes));
      }
    }
    catch(e){
      emit(NoteError(message: e.toString()));
    }
  }

  void sortByCategory(String id) async{
    emit(const NoteLoading());
    try{
      if (_allNotes.isEmpty) {
        emit(const NoteEmpty());
      }else{
        _allNotes = await _useCaseCollection.getNotes();
        _allNotes = _allNotes.where((element) => element!.categoryId == id).toList();
        emit(NoteDone(notes: _allNotes));
      }
    }
    catch(e){
      emit(NoteError(message: e.toString()));
    }
  }


  int get notesCount => _notesCount;
  void setPage(int page) => _page = page;

}
