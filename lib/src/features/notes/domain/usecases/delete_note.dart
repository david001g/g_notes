import 'package:g_notes/src/core/usecase/usecase.dart';
import 'package:g_notes/src/features/notes/domain/entities/note.dart';

import '../repositories/note_repository.dart';

class DeleteNoteUseCase implements UseCase<void,NoteEntity>{
  final NoteRepository _noteRepository;

  DeleteNoteUseCase(this._noteRepository);

  @override
  Future<void> call({NoteEntity? params}) {
    return _noteRepository.deleteNote(params!.id!);
  }
}