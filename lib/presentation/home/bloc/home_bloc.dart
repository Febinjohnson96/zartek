import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:zartek/domain/models/catergories_model.dart';
import 'package:zartek/domain/repo/home_repo.dart';
import 'package:zartek/managers/auth/auth.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({
    required Authentication authentication,
    required HomeRepo homeRepo,
  })  : _authentication = authentication,
        _homeRepo = homeRepo,
        super(HomeInitial()) {
    on<HomeLoadUserEvent>(_homeloadEvent);
    on<HomeLogoutEvent>(_logoutEvent);
  }
  final Authentication _authentication;
  final HomeRepo _homeRepo;

  void _homeloadEvent(HomeLoadUserEvent event, Emitter<HomeState> emit) async {
    final user = await _authentication.userAuthenticationStatus();
    final homeData = await _homeRepo.getHomeData();
    if (user != null) {
      emit(HomeLoaded(user: user, categories: homeData));
    }
  }

  void _logoutEvent(HomeLogoutEvent event, Emitter<HomeState> emit) async {
    await _authentication.signOut();
    emit(HomeLogout());
  }
}
