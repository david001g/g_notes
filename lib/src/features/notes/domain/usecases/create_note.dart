import 'package:g_notes/src/core/usecase/usecase.dart';
import 'package:g_notes/src/features/notes/domain/entities/note.dart';
import 'package:g_notes/src/features/notes/domain/repositories/note_repository.dart';

class CreateNoteUseCase implements UseCase<void, NoteEntity> {
  final NoteRepository _noteRepository;

  CreateNoteUseCase(this._noteRepository);

  @override
  Future<void> call({NoteEntity? params}) {
    return _noteRepository.createNote(params!);
  }
}
