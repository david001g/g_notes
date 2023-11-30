import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:g_notes/src/features/authentication/domain/entities/user.dart';
import 'package:g_notes/src/features/authentication/domain/usecases/authentication_use_cases.dart';
import 'package:meta/meta.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  final AuthenticationUseCases _useCaseCollection;

  late UserEntity? _user;
  late int _notesCount = 0;
  late int _categoriesCount = 0;

  AuthenticationCubit(this._useCaseCollection) : super(AuthenticationInitial());

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  Future<void> register() async{
    await _useCaseCollection.register();
  }
  Future<void> updateUser(UserEntity params) async{
    _user = params;
    await _useCaseCollection.updateUser(params);
    emit(AuthenticationAllDone(user: _user!, notesCount: notesCount, categoriesCount: categoriesCount));
  }
  Future<UserEntity?> getUser(String params) async{
    _user = await _useCaseCollection.getUser(params);
    return _user;
  }

  Future<void> getUserAllData() async{
    String currentUserId = FirebaseAuth.instance.currentUser!.uid;
    _user = await _useCaseCollection.getUser(currentUserId);
    _notesCount = await _useCaseCollection.countNotes();
    _categoriesCount = await _useCaseCollection.countCategories();
    emit(AuthenticationAllDone(user: _user!, notesCount: _notesCount, categoriesCount: _categoriesCount));
  }

  Future<int> countNotes() async{
    return await _useCaseCollection.countNotes();
  }

  Future<int> countCategories() async{
    return await _useCaseCollection.countCategories();
  }

  UserEntity? get user => _user;
  int get notesCount => _notesCount;
  int get categoriesCount => _categoriesCount;

}
