import 'package:bloc/bloc.dart';
import 'package:g_notes/src/features/categories/domain/entities/category.dart';
import 'package:g_notes/src/features/categories/domain/usecases/category_usecases.dart';
import 'package:meta/meta.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final CategoryUseCases _useCaseCollection;

  List<CategoryEntity?> _categories = [];

  CategoryCubit(this._useCaseCollection) : super(CategoryInitial());

  Future<void> getCategories() async {
    emit(CategoryLoading());
    _categories = await _useCaseCollection.getCategories();
    if (_categories.isEmpty) {
      emit(CategoryEmpty());
    } else {
      emit(CategoryRefresh());
    }
  }

  Future<CategoryEntity?> getCategory(String? id) async {
    final category = await _useCaseCollection.getCategoryById(params: id);
    return category;
  }

  Future<void> createCategory(CategoryEntity category) async {
    emit(CategoryLoading());
    await _useCaseCollection.createCategory(params: category);
    _categories = await _useCaseCollection.getCategories();
    emit(CategoryRefresh());
  }

  Future<void> updateCategory(CategoryEntity category) async {
    emit(CategoryLoading());
    await _useCaseCollection.updateCategory(params: category);
    _categories = await _useCaseCollection.getCategories();
    emit(CategoryRefresh());
  }

  Future<void> deleteCategory(String id) async {
    emit(CategoryLoading());
    await _useCaseCollection.deleteCategory(params: id);
    _categories = await _useCaseCollection.getCategories();
    if (_categories.isEmpty) {
      emit(CategoryEmpty());
    } else {
      emit(CategoryRefresh());
    }
  }
  Future<void> deleteAllCategories() async {
    await _useCaseCollection.deleteAllCategories();
  }

  void refreshCategories() async {
    emit(CategoryLoading());
    _categories = await _useCaseCollection.getCategories();
    emit(CategoryRefresh());
  }

  List<CategoryEntity?> get categories => _categories;
}
