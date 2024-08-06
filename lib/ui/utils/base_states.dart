class BaseInitialState {}

class BaseLoadingState {}

class BaseSuccessState<Type> {
  Type? data;

  BaseSuccessState({this.data});
}

class BaseErrorState {
  String errorMessage;

  BaseErrorState(this.errorMessage);
}

class ShowPass {}
