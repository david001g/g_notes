import 'package:g_notes/src/core/usecase/usecase.dart';
import 'package:g_notes/src/features/notes/domain/entities/note.dart';
import 'package:g_notes/src/features/notes/domain/repositories/note_repository.dart';

class GetNotes implements UseCase<List<NoteEntity?>, void> {
  final NoteRepository _repository;

  GetNotes(this._repository);

  @override
  Future<List<NoteEntity?>> call({void params}) async {
    return await _repository.getNotes();
  }
}