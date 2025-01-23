part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeLoaded extends HomeState {
  final User user;
  final List<Categories> categories;

  const HomeLoaded({required this.user, required this.categories});

  @override
  List<Object> get props => [user, categories];
}

final class HomeCartCount extends HomeState {
  final int count;
  const HomeCartCount({required this.count});

  @override
  List<Object> get props => [count];
}

final class HomeError extends HomeState {}

final class HomeLogout extends HomeState {}
