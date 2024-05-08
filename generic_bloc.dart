import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GenericBloc<S, T, U> extends Bloc<S, GenericState<T, U>> {
  GenericBloc(super.initialState);
}


class GenericState<T, U> extends Equatable {
  final T? state;
  final U value;

  const GenericState._(this.state, this.value);

  bool Is(T state) {
    return this.state == state;
  }

  static GenericState<T, U> update<T, U>(U value, T? state) {
    return GenericState<T, U>._(state, value);
  }

  @override
  List<Object?> get props => [value];
}

abstract class GenericEvent {}
