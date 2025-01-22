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

  const HomeLoaded({required this.user});

  @override
  List<Object> get props => [user];
}

final class HomeError extends HomeState {}

final class HomeLogout extends HomeState {}
