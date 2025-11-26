import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wedding_prompt_app/features/promptscreen/bloc/prompt_event.dart';
import 'package:wedding_prompt_app/features/promptscreen/bloc/prompt_state.dart';

class PromptBloc extends Bloc<PromptEvent, PromptState> {
  // Timer? timer;
  PromptBloc() : super(PromptState.initial()) {
    on<LoadData>(_onLoadData);
  }

  FutureOr<void> _onLoadData(LoadData event, Emitter<PromptState> emit) async {
    emit(state.copyWith(status: Status.loading, progress: 0));

    for (double i = 0; i <= 100; i++) {
      await Future.delayed(Duration(milliseconds: 100));
      emit(state.copyWith(progress: i));
    }

    emit(state.copyWith(status: Status.success));

    // emit(state.copyWith(status: Status.loading));
    // await Future.delayed(Duration(seconds: 5));
    // emit(state.copyWith(status: Status.success));
  }
}
