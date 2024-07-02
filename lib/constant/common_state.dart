abstract class CommonState {}

class CommonLoadingState extends CommonState {}

class CommonInitialState extends CommonState {}

class CommonSuccessState<Type> extends CommonState {
  Type news;
  CommonSuccessState({
    required this.news,
  });
}

class CommonErrorState extends CommonState {
  final String errorMsg;
  CommonErrorState({
    required this.errorMsg,
  });
}
