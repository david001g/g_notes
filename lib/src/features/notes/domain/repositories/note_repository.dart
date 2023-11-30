import 'package:g_notes/src/features/notes/domain/entities/note.dart';

abstract class NoteRepository {
  Future<List<NoteEntity?>> getNotes();
  Future<NoteEntity?> getNoteById(String id);
  Future<NoteEntity?> createNote(NoteEntity note);
  Future<NoteEntity?> updateNote(NoteEntity note);
  Future<int> getNotesLength();
  Future<void> deleteNote(String id);
  Future<void> deleteAllNotes();
}