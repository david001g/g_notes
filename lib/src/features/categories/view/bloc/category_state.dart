part of 'category_cubit.dart';

@immutable
abstract class CategoryState {}

class CategoryInitial extends CategoryState {}

class CategoryRefresh extends CategoryState {
  CategoryRefresh();
}

class CategoryLoading extends CategoryState {
  CategoryLoading();
}

class CategoryEmpty extends CategoryState {
  CategoryEmpty();
}