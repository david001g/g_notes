import 'package:equatable/equatable.dart';

class NoteEntity extends Equatable {
  final String? id;
  final String? userId;
  final String? categoryId;
  final String? title;
  final String? category;
  final String? content;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const NoteEntity({
    this.id,
    this.userId,
    this.categoryId,
    required this.title,
    required this.category,
    required this.content,
    this.createdAt,
    this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id,
        userId,
        categoryId,
        category,
        title,
        content,
        createdAt,
        updatedAt,
      ];

  @override
  String toString() {
    return 'NoteEntity(id: $id, userId: $userId, categoryId: $categoryId, title: $title, category: $category, content: $content, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}
