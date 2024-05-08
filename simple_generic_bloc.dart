import 'generic_bloc.dart';


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
