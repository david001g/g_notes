import 'package:g_notes/src/app/data/models/note_model.dart';
import 'package:g_notes/src/app/domain/entities/note.dart';
import 'package:g_notes/src/app/domain/repositories/note_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NoteRepositoryImpl implements NoteRepository {
  @override
  Future<NoteEntity?> createNote(NoteEntity note) async {
    try {
      var db = FirebaseFirestore.instance;
      var collection = db.collection('notes').doc();
      DateTime timestamp = DateTime.now();
      NoteModel newNote = NoteModel(
        id: collection.id,
        userId: note.userId,
        categoryId: note.categoryId,
        title: note.title,
        content: note.content,
        createdAt: timestamp,
        updatedAt: timestamp,
      );
      await collection.set(newNote.toJson()).then(
            (doc) => print("Document created with id: ${collection.id}"),
            onError: (e) => print("Error creating document $e"),
          );
      return Future.value(note);
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
  Future<NoteEntity?> getNoteById(String id) async {
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
  Future<List<NoteEntity?>> getNotes() async {
    try {
      List<NoteEntity> notes = [];
      var db = FirebaseFirestore.instance;
      await db.collection('notes').get().then(
          (event) => {
                print("Documents retrieved"),
                for (var doc in event.docs)
                  {notes.add(NoteModel.fromJson(doc.data()))}
              },
          onError: (e) => print("Error getting documents $e"));
      return Future.value(notes);
    } catch (e) {
      print(e);
      return Future.value([]);
    }
  }

  @override
  Future<NoteEntity?> updateNote(NoteEntity note) async {
    try {
      var db = FirebaseFirestore.instance;
      var collection = db.collection('notes').doc();
      DateTime timestamp = DateTime.now();
      NoteModel updateNote = NoteModel(
        id: note.id!,
        userId: note.userId,
        categoryId: note.categoryId,
        title: note.title,
        content: note.content,
        createdAt: note.createdAt!,
        updatedAt: timestamp,
      );
      await collection.update(updateNote.toJson()).then(
            (doc) => print("Document updated with id: ${collection.id}"),
            onError: (e) => print("Error updating document $e"),
          );
      return Future.value(note);
    } catch (e) {
      print(e);
      return Future.value(null);
    }
  }
}
