import 'package:g_notes/src/features/authentication/data/repositories/user_repository_impl.dart';
import 'package:g_notes/src/features/authentication/domain/repositories/user_repository.dart';
import 'package:g_notes/src/features/authentication/domain/usecases/authentication_use_cases.dart';
import 'package:g_notes/src/features/authentication/view/bloc/authentication_cubit.dart';
import 'package:g_notes/src/features/categories/data/repositories/category_repository_impl.dart';
import 'package:g_notes/src/features/categories/domain/repositories/category_repository.dart';
import 'package:g_notes/src/features/categories/domain/usecases/category_usecases.dart';
import 'package:g_notes/src/features/categories/view/bloc/category_cubit.dart';
import 'package:g_notes/src/features/notes/data/repositories/note_repository_impl.dart';
import 'package:g_notes/src/features/notes/domain/repositories/note_repository.dart';
import 'package:g_notes/src/features/notes/domain/usecases/note_usecases.dart';
import 'package:g_notes/src/features/notes/view/bloc/notes_cubit.dart';
import 'package:g_notes/src/features/notes/view/bloc/pagination_cubit.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init()async{
  //Dependencies
  sl.registerLazySingleton<NoteRepository>(() => NoteRepositoryImpl());
  sl.registerLazySingleton<CategoryRepository>(() => CategoryRepositoryImpl());
  sl.registerLazySingleton<UserRepository>(() => UserRepositoryImpl());

  //Use cases
  sl.registerLazySingleton<NoteUseCases>(() => NoteUseCases(sl()));
  sl.registerLazySingleton<CategoryUseCases>(() => CategoryUseCases(sl()));
  sl.registerLazySingleton<AuthenticationUseCases>(() => AuthenticationUseCases(sl()));

  //Cubit
  sl.registerFactory<PaginationCubit>(() => PaginationCubit());
  sl.registerFactory<NotesCubit>(() => NotesCubit(sl()));
  sl.registerFactory<AuthenticationCubit>(() => AuthenticationCubit(sl()));
  sl.registerFactory<CategoryCubit>(() => CategoryCubit(sl()));

  //Others
}