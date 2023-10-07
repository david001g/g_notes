import 'package:g_notes/src/app/domain/entities/note.dart';

import '../../data/models/note_model.dart';

abstract class NoteRepository {
  Future<List<NoteEntity?>> getNotes();
  Future<NoteEntity?> getNoteById(String id);
  Future<NoteEntity?> createNote(NoteEntity note);
  Future<NoteEntity?> updateNote(NoteEntity note);
  Future<void> deleteNote(String id);
}