part of 'main_bloc.dart';

abstract class MainScreenState extends Equatable {
  const MainScreenState();
  
  @override
  List<Object> get props => [];
}

class MainScreenInitial extends MainScreenState {}
class MainScreenLoading extends MainScreenState{}
class MainScreenLoaded extends MainScreenState{
  final List<CategoryEntity> categories;
 const MainScreenLoaded({required this.categories});
}
class MainScreenError extends MainScreenState{
  final String error;
 const MainScreenError({ required this.error});
}

