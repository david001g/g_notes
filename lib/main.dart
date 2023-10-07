import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:g_notes/firebase_options.dart';
import 'package:g_notes/src/app/data/repositories/note_repository_impl.dart';
import 'package:g_notes/src/app/domain/entities/note.dart';

import 'src/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  NoteEntity test = const NoteEntity(
    id: null,
    userId: null,
    categoryId: null,
    title: 'Test',
    content: 'Test',
    createdAt: null,
    updatedAt: null,
  );

  //await NoteRepositoryImpl().createNote(test);
  //await NoteRepositoryImpl().deleteNote('1FphJiJg6VBvdJrvGprm');
  var response = await NoteRepositoryImpl().getNotes();
  //var response = await NoteRepositoryImpl().getNoteById('sU9YD86MxDbqEdp3Pc9P');
  for (var item in response) {
    print(item);
  }
  runApp(const MyApp());
}
