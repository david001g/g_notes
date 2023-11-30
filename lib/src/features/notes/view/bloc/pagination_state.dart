part of 'pagination_cubit.dart';

@immutable
abstract class PaginationState {
  const PaginationState();
}

class PaginationInitial extends PaginationState {
  const PaginationInitial();
}

class PaginationUpdated extends PaginationState {
  const PaginationUpdated();
}
