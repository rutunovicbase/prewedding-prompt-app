import 'dart:async';

import 'package:bloc/bloc.dart';

import 'bottom_navigation_bar_event.dart';
import 'bottom_navigation_bar_state.dart';

class BottomNavigationBarBloc
    extends Bloc<BottomNavigationBarEvent, BottomNavigationBarState> {
  BottomNavigationBarBloc() : super(BottomNavigationBarState.initial()) {
    on<NavBarIndex>(_onNavBarIndex);
  }

  FutureOr<void> _onNavBarIndex(
    NavBarIndex event,
    Emitter<BottomNavigationBarState> emit,
  ) {
    emit(state.copyWith(currentNavBarIndex: event.currentNavBarIndex));
  }
}
