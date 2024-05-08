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


class SimpleGenericBloc<U> extends Bloc<GenericEvent, SimpleGenericState<U>> {
  SimpleGenericBloc(super.initialState);
}


enum SGMyState {
  initial,
  changed,
}



class SimpleGenericState<U> extends GenericState<SGMyState, U> {
  static const STATE_INITIAL = SGMyState.initial;
  static const STATE_CHANGED = SGMyState.changed;

  const SimpleGenericState._(SGMyState state, value) : super._(state, value);

  bool isInitial() {
    return super.Is(SGMyState.initial);
  }

  bool isChanged() {
    return super.Is(SGMyState.changed);
  }

  static SimpleGenericState<U> initial<U>(U? value) {
    return SimpleGenericState<U>._(SGMyState.initial, value);
  }

  static SimpleGenericState<U> update<U>(U value) {
    return SimpleGenericState<U>._(SGMyState.changed, value);
  }
}

abstract class GenericEvent {}
