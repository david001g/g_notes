import '../entities/user.dart';

abstract class UserRepository {
  Future<UserEntity> getUser();
  Future<UserEntity> createUser();
  Future<UserEntity> updateUser();
  Future<UserEntity> deleteUser();
}