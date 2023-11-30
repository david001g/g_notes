import 'package:g_notes/src/core/usecase/usecase.dart';
import 'package:g_notes/src/features/categories/domain/entities/category.dart';
import 'package:g_notes/src/features/categories/domain/repositories/category_repository.dart';

class UpdateCategory implements UseCase<CategoryEntity?, CategoryEntity> {

  final CategoryRepository _repository;

  UpdateCategory(this._repository);

  @override
  Future<CategoryEntity?> call({CategoryEntity? params}) async {
    return await _repository.updateCategory(params!);
  }

}