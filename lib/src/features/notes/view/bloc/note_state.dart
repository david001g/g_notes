part of 'notes_cubit.dart';

@immutable
abstract class NotesState {
  final List<NoteEntity?> ? notes;
  final String ? message;
  const NotesState({this.notes, this.message});
}

class NoteInitial extends NotesState {
  const NoteInitial() : super();
}

class NoteLoading extends NotesState {
  const NoteLoading() : super();
}

class NoteDone extends NotesState {
  const NoteDone({required List<NoteEntity?> notes}) : super(notes: notes);
}

class NoteEmpty extends NotesState {
  const NoteEmpty() : super();
}

class NoteError extends NotesState {
  const NoteError({required String message}) : super(message: message);
}

class NotePaginationRefresh extends NotesState {
  const NotePaginationRefresh() : super();
}

