import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:zartek/core/utils/applogger.dart';
import 'package:zartek/managers/auth/auth.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc({required Authentication authentication})
      : _authentication = authentication,
        super(SplashInitial()) {
    on<SplashInitialEvent>(splashInitialEvent);
  }
  final Authentication _authentication;
  void splashInitialEvent(
      SplashInitialEvent event, Emitter<SplashState> emit) async {
    emit(SplashLoading());
    final user = await _authentication.userAuthenticationStatus();
    if (user != null) {
      await Future.delayed(const Duration(seconds: 2));
      AppLogger.infolog(user.email.toString());
      emit(AuthenticatedAccount());
    } else {
      await Future.delayed(const Duration(seconds: 2));
      emit(UnAuthenticatedAccount());
    }
    emit(SplashLoaded());
  }
}
