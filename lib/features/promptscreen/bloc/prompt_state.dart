enum Status { initial, loading, success, error }

class PromptState {
  final Status? status;
  final int? progress;
  PromptState({this.status = Status.initial, this.progress = 0});
  factory PromptState.initial() {
    return PromptState();
  }

  PromptState copyWith({Status? status, int? progress}) {
    return PromptState(
      status: status ?? this.status,
      progress: progress ?? this.progress,
    );
  }
}
