import '../entities/category.dart';

abstract class CategoryRepository {
  Future<List<CategoryEntity?>> getCategories();
  Future<CategoryEntity?> getCategoryById(String id);
  Future<CategoryEntity?> createCategory(CategoryEntity category);
  Future<CategoryEntity?> updateCategory(CategoryEntity category);
  Future<void> deleteCategory(String id);
  Future<bool> isCategoryEmpty(String id);
  Future<int> getCategoriesLength();
}