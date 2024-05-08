# Simple Generic Bloc
It will help you implement Bloc by writing few dart file/code since it is Generic

# Usage:
  - add `generic_bloc.dart` in your project's `lib` folder.
# Create a Bloc object:
  - create a bloc dart file `eg:counter_bloc.dart` in your project.
  - extend class to `SimpleGenericBloc` and cast generic class within the object class you want to use for the bloc like bellow:

  ```dart
//import generic_bloc.dart

import 'package:path/to/generic_bloc.dart';

// create event's

class Increment extends GenericEvent {}

  
class CounterBloc extends SimpleGenericBloc<int?> {
  int? count;

  CounterBloc() : super(SimpleGenericState.initial(0)) {
    AppService app = getIt<AppService>();

    on<GenericEvent>((event, emit) async {
      if (event is Increment) {
        count++;
        emit(SimpleGenericState.update(count));
      }
    });
  }
}

```
