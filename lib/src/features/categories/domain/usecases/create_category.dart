import 'package:g_notes/src/core/usecase/usecase.dart';
import 'package:g_notes/src/features/categories/domain/entities/category.dart';
import 'package:g_notes/src/features/categories/domain/repositories/category_repository.dart';

class CreateCategoryUseCase implements UseCase<void, CategoryEntity>{
  final CategoryRepository _categoryRepository;

  CreateCategoryUseCase(this._categoryRepository);

  @override
  Future<void> call({CategoryEntity? params}) {
    return _categoryRepository.createCategory(params!);
  }
}