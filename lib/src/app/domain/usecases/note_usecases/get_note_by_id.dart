import 'package:g_notes/src/app/domain/entities/note.dart';
import 'package:g_notes/src/app/domain/repositories/note_repository.dart';
import 'package:g_notes/src/core/usecase/usecase.dart';

class GetNoteByIdUseCase implements UseCase<NoteEntity?, String> {
  final NoteRepository _noteRepository;

  GetNoteByIdUseCase(this._noteRepository);

  @override
  Future<NoteEntity?> call({String? params}) {
    return _noteRepository.getNoteById(params!);
  }
}