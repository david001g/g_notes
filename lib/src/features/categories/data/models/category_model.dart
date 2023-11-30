import 'package:g_notes/src/features/categories/domain/entities/category.dart';

class CategoryModel extends CategoryEntity{
  const CategoryModel({
    required String? id,
    required String? userId,
    required String? name,
    required DateTime? createdAt,
    required DateTime? updatedAt,
  }) : super(
    id: id,
    userId: userId,
    name: name,
    createdAt: createdAt,
    updatedAt: updatedAt,
  );

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    id: json['id'],
    userId: json['user_id'],
    name: json['name'],
    createdAt: DateTime.parse(json['created_at']),
    updatedAt: DateTime.parse(json['updated_at']),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'user_id': userId,
    'name': name,
    'created_at': createdAt?.toIso8601String(),
    'updated_at': updatedAt?.toIso8601String(),
  };

}