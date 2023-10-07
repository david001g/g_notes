import 'package:equatable/equatable.dart';

class CategoryEntity extends Equatable{
  final int id;
  final int userId;
  final String name;
  final DateTime createdAt;
  final DateTime updatedAt;

  const CategoryEntity({
    required this.id,
    required this.userId,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [
    id,
    userId,
    name,
    createdAt,
    updatedAt,
  ];
}