import 'package:g_notes/src/features/authentication/domain/entities/user.dart';

class UserModel extends UserEntity{
  const UserModel({
    required String? id,
    required String? name,
    required String? email,
    required String? image,
  }) : super(
    id: id,
    name: name,
    email: email,
    image: image,
  );

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json['id'],
    name: json['name'],
    email: json['email'],
    image: json['image'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'email': email,
    'image': image,
  };
}