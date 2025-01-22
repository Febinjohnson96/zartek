part of 'splash_bloc.dart';

sealed class SplashState extends Equatable {
  const SplashState();

  @override
  List<Object> get props => [];
}

final class SplashInitial extends SplashState {}

final class SplashLoaded extends SplashState {}

final class SplashLoading extends SplashState {}

final class SplashError extends SplashState {}

final class AuthLoading extends SplashState {}

final class AuthenticatedAccount extends SplashState {}

final class UnAuthenticatedAccount extends SplashState {}
