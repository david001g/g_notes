import 'package:g_notes/src/app/domain/entities/note.dart';
import 'package:g_notes/src/app/domain/repositories/note_repository.dart';
import 'package:g_notes/src/core/usecase/usecase.dart';

class GetNotes implements UseCase<List<NoteEntity?>, void> {
  final NoteRepository repository;

  GetNotes(this.repository);

  @override
  Future<List<NoteEntity?>> call({void params}) async {
    return await repository.getNotes();
  }
}