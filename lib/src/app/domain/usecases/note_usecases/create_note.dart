import 'package:g_notes/src/app/domain/entities/note.dart';
import 'package:g_notes/src/app/domain/repositories/note_repository.dart';
import 'package:g_notes/src/core/usecase/usecase.dart';

class CreateNoteUseCase implements UseCase<void, NoteEntity> {
  final NoteRepository _noteRepository;

  CreateNoteUseCase(this._noteRepository);

  @override
  Future<void> call({NoteEntity? params}) {
    return _noteRepository.createNote(params!);
  }
}
