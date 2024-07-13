class BaseInitialState {}

class BaseLoadingState {}

class BaseSuccessState {}

class BaseErrorState {
  String errorMessage;

  BaseErrorState(this.errorMessage);
}

class ShowPass{}