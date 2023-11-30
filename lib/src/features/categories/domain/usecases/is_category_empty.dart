import 'package:g_notes/src/core/usecase/usecase.dart';
import 'package:g_notes/src/features/categories/domain/repositories/category_repository.dart';

class IsCategoryEmpty implements UseCase<bool, String> {
  final CategoryRepository _repository;

  IsCategoryEmpty(this._repository);

  @override
  Future<bool> call({String? params}) async {
    return await _repository.isCategoryEmpty(params!);
  }
}
