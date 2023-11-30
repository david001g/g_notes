import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_oauth_apple/firebase_ui_oauth_apple.dart';
import 'package:firebase_ui_oauth_facebook/firebase_ui_oauth_facebook.dart';
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:g_notes/firebase_options.dart';
import 'package:g_notes/src/features/authentication/view/bloc/authentication_cubit.dart';
import 'package:g_notes/src/features/categories/data/repositories/category_repository_impl.dart';
import 'package:g_notes/src/features/categories/domain/repositories/category_repository.dart';
import 'package:g_notes/src/features/notes/data/repositories/note_repository_impl.dart';
import 'package:g_notes/src/features/notes/domain/entities/note_factory.dart';
import 'package:g_notes/src/features/notes/domain/repositories/note_repository.dart';
import 'package:g_notes/src/features/notes/domain/usecases/note_usecases.dart';
import 'package:g_notes/src/features/notes/view/bloc/notes_cubit.dart';
import 'package:g_notes/src/features/notes/view/bloc/pagination_cubit.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import 'src/app.dart';
import 'src/core/services/injection_containder.dart';
import 'src/features/categories/view/bloc/category_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseUIAuth.configureProviders([
    GoogleProvider(
        clientId:
            "269545314442-4u4sql3kj50001pkeudkla4inoa10ljq.apps.googleusercontent.com"),
    AppleProvider(),
    FacebookProvider(clientId: "1:269545314442:web:2d5f771818570de15cf573"),
  ]);

  // check if is running on Web
  if (kIsWeb) {
    // initialiaze the facebook javascript SDK
    await FacebookAuth.i.webAndDesktopInitialize(
      appId: "YOUR_FACEBOOK_APP_ID",
      cookie: true,
      xfbml: true,
      version: "v15.0",
    );
  }

  usePathUrlStrategy();
  GoRouter.optionURLReflectsImperativeAPIs = true;

  //deleteDatabase();
  //generateFakeData();

  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (context) => NotesCubit(sl()),
    ),
    BlocProvider(
      create: (context) => PaginationCubit(),
    ),
    BlocProvider(
      create: (context) => AuthenticationCubit(sl()),
    ),
    BlocProvider(
      create: (context) => CategoryCubit(sl()),
    )
  ], child: const MyApp()));
}

void generateFakeData() {
  NoteRepository noteRepository = NoteRepositoryImpl();
  CategoryRepository categoryRepository = CategoryRepositoryImpl();

  NoteFactory noteFactory = NoteFactory();
  NoteUseCases noteUseCases = NoteUseCases(noteRepository);

  final fakeNotes = noteFactory.generateFakeList(length: 10);

  fakeNotes.forEach((note) async {
    await noteUseCases.createNote(
      params: note,
    );
  });
}

void deleteDatabase() async {
  NoteRepository noteRepository = NoteRepositoryImpl();
  await noteRepository.deleteAllNotes();
}
