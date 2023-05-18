import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:debut/repositories/category/category_repository.dart';
import 'package:equatable/equatable.dart';

import '../../model/model.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository _categoryRepository;
  StreamSubscription? _categorySubscription;

  CategoryBloc({required CategoryRepository categoryRepository})
      : _categoryRepository = categoryRepository,
        super(CategoryLoading());

  @override
  Stream<CategoryState> mapEventToState(
    CategoryEvent event,
  ) async* {
    if (event is LoadCategories) {
      yield* _mapLoadCategoryToState();
    }
    if (event is UpdateCategories) {
      yield* _mapUpdateCategoryToState(event);
    }
  }

  Stream<CategoryState> _mapLoadCategoryToState() async* {
    _categorySubscription?.cancel();
    _categorySubscription = _categoryRepository.getAllCategories().listen(
          (categories) => add(
            UpdateCategories(categories),
          ),
        );
  }

  Stream<CategoryState> _mapUpdateCategoryToState(
      UpdateCategories event) async* {
    yield CategoryLoaded(categories: event.categories);
  }
}
