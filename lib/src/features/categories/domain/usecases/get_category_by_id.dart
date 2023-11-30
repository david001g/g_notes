import 'package:g_notes/src/core/usecase/usecase.dart';
import 'package:g_notes/src/features/categories/domain/entities/category.dart';
import 'package:g_notes/src/features/categories/domain/repositories/category_repository.dart';

class GetCategoryByIdUseCase implements UseCase<CategoryEntity?,String>{
  final CategoryRepository _repository;

  GetCategoryByIdUseCase(this._repository);

  @override
  Future<CategoryEntity?> call({String? params}) async {
    return await _repository.getCategoryById(params!);
  }
}