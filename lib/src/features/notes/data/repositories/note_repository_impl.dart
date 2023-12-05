import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:g_notes/src/features/notes/data/models/note_model.dart';
import 'package:g_notes/src/features/notes/domain/entities/note.dart';
import 'package:g_notes/src/features/notes/domain/repositories/note_repository.dart';

class NoteRepositoryImpl implements NoteRepository {
  @override
  Future<NoteModel?> createNote(NoteEntity note) async {
    try {
      var db = FirebaseFirestore.instance;
      DateTime timestamp = DateTime.now();
      NoteModel newNote = NoteModel(
        id: note.id,
        userId: note.userId,
        categoryId: note.categoryId,
        category: note.category,
        title: note.title,
        content: note.content,
        createdAt: timestamp,
        updatedAt: timestamp,
      );
      await db.collection('notes').doc(note.id).set(newNote.toJson()).then(
            (doc) => print("Document created with id: ${note.id}"),
            onError: (e) => print("Error creating document $e"),
          );
      return Future.value(newNote);
    } catch (e) {
      print(e);
      return Future.value(null);
    }
  }

  @override
  Future<void> deleteNote(String id) async {
    try {
      var db = FirebaseFirestore.instance;
      await db.collection('notes').doc(id).delete().then(
            (doc) => print("Document deleted"),
            onError: (e) => print("Error updating document $e"),
          );
    } catch (e) {
      print(e);
    }
  }

  @override
  Future<void> deleteAllNotes() async {
    try {
      var db = FirebaseFirestore.instance;
      var currentUserId = FirebaseAuth.instance.currentUser?.uid;
      await db.collection('notes')
          .where('user_id', isEqualTo: currentUserId)
          .get().then(
              (event) => {
                for (var doc in event.docs)
                  {doc.reference.delete()}
              },
              onError: (e) => print("Error getting documents $e"));
    } catch (e) {
      print(e);
    }
  }

  @override
  Future<NoteModel?> getNoteById(String id) async {
    try {
      var db = FirebaseFirestore.instance;
      var data = await db.collection('notes').doc(id).get();
      NoteModel note = NoteModel.fromJson(data.data()!);
      return Future.value(note);
    } catch (e) {
      print(e);
      return Future.value(null);
    }
  }

  @override
  Future<List<NoteModel?>> getNotes() async {
    try {
      List<NoteModel> notes = [];
      var db = FirebaseFirestore.instance;
      var currentUserId = FirebaseAuth.instance.currentUser?.uid;
      await db.collection('notes')
          .where('user_id', isEqualTo: currentUserId)
          .get().then(
          (event) => {
                for (var doc in event.docs)
                  {notes.add(NoteModel.fromJson(doc.data()))}
              },
          onError: (e) => print("Error getting documents $e"));
      notes.sort((a, b) => b.updatedAt!.compareTo(a.updatedAt!));
      return Future.value(notes);
    } catch (e) {
      print(e);
      return Future.value([]);
    }
  }

  @override
  Future<NoteModel?> updateNote(NoteEntity note) async {
    try {
      if (note.id == null) {
        print("Note id is null");
        return Future.value(null);
      }

      var db = FirebaseFirestore.instance;
      DateTime timestamp = DateTime.now();
      NoteModel updateNote = NoteModel(
        id: note.id,
        userId: note.userId,
        categoryId: note.categoryId,
        category: note.category,
        title: note.title,
        content: note.content,
        createdAt: note.createdAt,
        updatedAt: timestamp,
      );
      await db.collection('notes').doc(note.id).update(updateNote.toJson()).then(
            (doc) => print("Document updated with id: ${note.id}"),
            onError: (e) => print("Error updating document $e"),
          );
      return Future.value(updateNote);
    } catch (e) {
      print(e);
      return Future.value(null);
    }
  }

  @override
  Future<int> getNotesLength() async{
    try {
      var db = FirebaseFirestore.instance;
      var currentUserId = FirebaseAuth.instance.currentUser?.uid;
      var data = await db.collection('notes')
          .where('user_id', isEqualTo: currentUserId)
          .get();
      return Future.value(data.docs.length);
    } catch (e) {
      print(e);
      return Future.value(0);
    }
  }
}
