import 'package:g_notes/src/core/usecase/usecase.dart';
import 'package:g_notes/src/features/categories/domain/repositories/category_repository.dart';

class DeleteCategoryUseCase implements UseCase<void, String> {
  final CategoryRepository _repository;

  DeleteCategoryUseCase(this._repository);

  @override
  Future<void> call({String? params}) {
    return _repository.deleteCategory(params!);
  }
}