part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class HomeInitialEvent extends HomeEvent {}

class HomeLoadUserEvent extends HomeEvent {}

class HomeLoadEvent extends HomeEvent {}

class HomeLogoutEvent extends HomeEvent {}
