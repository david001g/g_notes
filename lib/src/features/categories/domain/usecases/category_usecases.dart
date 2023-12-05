import 'package:g_notes/src/features/categories/domain/entities/category.dart';
import 'package:g_notes/src/features/categories/domain/repositories/category_repository.dart';

class CategoryUseCases {
  final CategoryRepository _categoryRepository;

  CategoryUseCases(this._categoryRepository);

  Future<void> createCategory({CategoryEntity? params}) {
    return _categoryRepository.createCategory(params!);
  }
  Future<void> deleteCategory({String? params}) {
    return _categoryRepository.deleteCategory(params!);
  }
  Future<void> deleteAllCategories({void params}) {
    return _categoryRepository.deleteAllCategories();
  }
  Future<List<CategoryEntity?>> getCategories({void params}) async {
    return await _categoryRepository.getCategories();
  }
  Future<CategoryEntity?> getCategoryById({String? params}) async {
    return await _categoryRepository.getCategoryById(params!);
  }
  Future<bool> isCategoryEmpty({String? params}) async {
    return await _categoryRepository.isCategoryEmpty(params!);
  }
  Future<CategoryEntity?> updateCategory({CategoryEntity? params}) async {
    return await _categoryRepository.updateCategory(params!);
  }
  Future<int> getCategoriesLength({void params}) async{
    return await _categoryRepository.getCategoriesLength();
  }
}