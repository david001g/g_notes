import 'package:g_notes/src/app/domain/entities/note.dart';

class NoteModel extends NoteEntity {
  const NoteModel({
    required String? id,
    required String? userId,
    required String? categoryId,
    required String? title,
    required String? content,
    required DateTime? createdAt,
    required DateTime? updatedAt,
  }) : super(
          id: id,
          userId: userId,
          categoryId: categoryId,
          title: title,
          content: content,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  factory NoteModel.fromJson(Map<String, dynamic> json) => NoteModel(
        id: json['id'],
        userId: json['user_id'],
        categoryId: json['category_id'],
        title: json['title'],
        content: json['content'],
        createdAt: DateTime.parse(json['created_at']),
        updatedAt: DateTime.parse(json['updated_at']),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'user_id': userId,
        'category_id': categoryId,
        'title': title,
        'content': content,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };
}
