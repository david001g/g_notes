import 'package:g_notes/src/features/authentication/domain/entities/user.dart';
import 'package:g_notes/src/features/authentication/domain/repositories/user_repository.dart';

class AuthenticationUseCases{
  final UserRepository _userRepository;

  AuthenticationUseCases(this._userRepository);

  Future<void> register() {
    return _userRepository.createUser();
  }
  Future<void> updateUser(UserEntity params) {
    return _userRepository.updateUser(params);
  }
  Future<UserEntity?> getUser(String params) async{
    return await _userRepository.getUser(params);
  }

  Future<int> countNotes() async{
    return await _userRepository.countNotes();
  }

  Future<int> countCategories() async{
    return await _userRepository.countCategories();
  }
}