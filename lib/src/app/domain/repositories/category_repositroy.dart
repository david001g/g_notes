import '../entities/category.dart';

abstract class CategoryRepository {
  Future<List<CategoryEntity>> getCategories();
  Future<CategoryEntity> getCategoryById(int id);
  Future<CategoryEntity> createCategory();
  Future<CategoryEntity> updateCategory();
  Future<CategoryEntity> deleteCategory();
}