import 'package:g_notes/src/features/notes/domain/entities/note.dart';
import 'package:g_notes/src/features/notes/domain/repositories/note_repository.dart';

class NoteUseCases{
  final NoteRepository _noteRepository;

  NoteUseCases(this._noteRepository);

  Future<void> createNote({NoteEntity? params}) {
    return _noteRepository.createNote(params!);
  }
  Future<void> deleteNote({String? params}) {
    return _noteRepository.deleteNote(params!);
  }
  Future<List<NoteEntity?>> getNotes({void params}) async {
    return await _noteRepository.getNotes();
  }
  Future<NoteEntity?> getNoteById({String? params}) async{
    return await _noteRepository.getNoteById(params!);
  }
  Future<void> updateNote({NoteEntity? params}){
    return _noteRepository.updateNote(params!);
  }
  Future<void> deleteAllNotes({void params}) {
    return _noteRepository.deleteAllNotes();
  }

  Future<int> getNotesLength({void params}) async{
    return await _noteRepository.getNotesLength();
  }
}