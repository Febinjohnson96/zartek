import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:zartek/managers/auth/auth.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({
    required Authentication authentication,
  })  : _authentication = authentication,
        super(HomeInitial()) {
    on<HomeLoadUserEvent>(_homeloadEvent);
    on<HomeLogoutEvent>(_logoutEvent);
  }
  final Authentication _authentication;

  void _homeloadEvent(HomeLoadUserEvent event, Emitter<HomeState> emit) async {
    final user = await _authentication.userAuthenticationStatus();
    if (user != null) {
      emit(HomeLoaded(user: user));
    }
  }

  void _logoutEvent(HomeLogoutEvent event, Emitter<HomeState> emit) async {
    await _authentication.signOut();
    emit(HomeLogout());
  }
}
