import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'pagination_state.dart';

class PaginationCubit extends Cubit<PaginationState> {
  late int _totalPage = 0;
  late int _currentPage = 0;

  PaginationCubit() : super(const PaginationInitial());

  void setTotalPage(int totalPage) {
    _totalPage = totalPage;
    // ignore: prefer_const_constructors
    emit(PaginationUpdated());
  }

  void setCurrentPage(int currentPage) {
    _currentPage = currentPage;
    // ignore: prefer_const_constructors
    emit(PaginationUpdated());
  }

  int get getCurrentPage => _currentPage + 1;

  int get getCurrentPageIndex => _currentPage;

  int get getTotalPage => _totalPage;

  int get getTotalPageIndex => _totalPage - 1;

  void nextPage() {
    if (_currentPage < _totalPage - 1) {
      _currentPage++;
      // ignore: prefer_const_constructors
      emit(PaginationUpdated());
    }
  }

  void previousPage() {
    if (_currentPage > 0) {
      _currentPage--;
      // ignore: prefer_const_constructors
      emit(PaginationUpdated());
    }
  }

  void jumpToPage(int page) {
    if (page >= 0 && page < _totalPage) {
      _currentPage = page;
      emit(const PaginationUpdated());
    }
  }

  void reset() => emit(const PaginationInitial());

  void refresh() => emit(const PaginationUpdated());
}
