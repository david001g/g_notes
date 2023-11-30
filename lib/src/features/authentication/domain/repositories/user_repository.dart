import '../entities/user.dart';

abstract class UserRepository {
  Future<UserEntity?> getUser(String id);
  Future<UserEntity> createUser();
  Future<UserEntity> updateUser(UserEntity user);
  Future<UserEntity> deleteUser();
  Future<int> countNotes();
  Future<int> countCategories();
}