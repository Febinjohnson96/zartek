part of 'splash_bloc.dart';

sealed class SplashState extends Equatable {
  const SplashState();

  @override
  List<Object> get props => [];
}

final class SplashInitial extends SplashState {}

final class SplashLoaded extends SplashState {
  final bool isLoaded;

  const SplashLoaded({required this.isLoaded});

  @override
  List<Object> get props => [isLoaded];
}

final class AuthenticatedAccount extends SplashState {}

final class UnAuthenticatedAccount extends SplashState {}
