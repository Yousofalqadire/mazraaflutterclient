import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../domin/entities/category_entity.dart';
import '../../../../domin/use_cases/get_categories_usecases.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainScreenBloc extends Bloc<MainEvent, MainScreenState> {
  final CategoriesUseCases  categoriesUseCases = CategoriesUseCases();
  MainScreenBloc() : super(MainScreenInitial())  {
    on<GetCategoryEvent>((event, emit)async {
      emit(MainScreenLoading());
      final failureOrCategories = await categoriesUseCases.getCategories();
      failureOrCategories.fold(
              (failure) => emit(MainScreenError(error: failure)),
              (categories) => emit(MainScreenLoaded(categories: categories) ));

    });
  }
}
