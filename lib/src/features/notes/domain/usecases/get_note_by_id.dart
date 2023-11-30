import 'package:g_notes/src/core/usecase/usecase.dart';
import 'package:g_notes/src/features/notes/domain/entities/note.dart';
import 'package:g_notes/src/features/notes/domain/repositories/note_repository.dart';

class GetNoteByIdUseCase implements UseCase<NoteEntity?, String> {
  final NoteRepository _noteRepository;

  GetNoteByIdUseCase(this._noteRepository);

  @override
  Future<NoteEntity?> call({String? params}) {
    return _noteRepository.getNoteById(params!);
  }
}