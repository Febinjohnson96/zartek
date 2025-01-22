import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:zartek/core/utils/applogger.dart';
import 'package:zartek/managers/auth/auth.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({
    required Authentication authentication,
  })  : _authentication = authentication,
        super(AuthInitial()) {
    on<GoogleAuthEvent>(_googleAuthEvent);
  }

  final Authentication _authentication;
  void _googleAuthEvent(GoogleAuthEvent event, Emitter<AuthState> emit) async {
    AppLogger.infolog("AuthLoginEvent");
    emit(AuthLoading());
    try {
      final userAuth = await _authentication.googleAuthentication();

      if (userAuth.user != null) {
        emit(AuthSuccess());
      } else {
        emit(AuthError());
      }
    } catch (e) {
      AppLogger.errorlog(e.toString());
      emit(AuthError());
    }

    emit(AuthLoaded());
  }
}
