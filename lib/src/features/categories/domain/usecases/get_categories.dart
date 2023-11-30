import 'package:g_notes/src/core/usecase/usecase.dart';
import 'package:g_notes/src/features/categories/domain/entities/category.dart';
import 'package:g_notes/src/features/categories/domain/repositories/category_repository.dart';

class GetCategories implements UseCase<List<CategoryEntity?>, void> {
  final CategoryRepository _repository;

  GetCategories(this._repository);

  @override
  Future<List<CategoryEntity?>> call({void params}) async {
    return await _repository.getCategories();
  }
}
