import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:wedding_prompt_app/features/favoritescreen/bloc/favorite_state.dart';

import 'favorite_event.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc() : super(FavoriteState.initial()) {
    on<SelectedIndex>(_onSelectedIndex);
  }

  FutureOr<void> _onSelectedIndex(
    SelectedIndex event,
    Emitter<FavoriteState> emit,
  ) {
    emit(state.copyWith(selectedIndex: event.selectedIndex));
  }
}
