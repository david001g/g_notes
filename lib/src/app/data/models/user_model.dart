import 'package:g_notes/src/app/domain/entities/user.dart';

class UserModel extends UserEntity{
  const UserModel({
    required String id,
    required String name,
    required String email,
    required String password,
  }) : super(
    id: id,
    name: name,
    email: email,
    password: password,
  );

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json['id'],
    name: json['name'],
    email: json['email'],
    password: json['password'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'email': email,
    'password': password,
  };
}