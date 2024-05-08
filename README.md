# Simple Generic Bloc
It will help you implement Bloc by writing few dart file/code since it is Generic

# Dependencies:
    - equatable
    - flutter_bloc
# Usage:
  - add `generic_bloc.dart` in your project's `lib` folder.
# Create a Bloc object:
  - create a bloc dart file `eg:counter_bloc.dart` in your project.
  - extend class to `SimpleGenericBloc` and cast generic class within the object class you want to use  for the bloc.
  - here we are using `SimpleGenericBloc<int?> ` because our bloc will store only integer, you can put your model or any other object type.

  ```dart
//import generic_bloc.dart

import 'package:path/to/generic_bloc.dart';

// create event's

class Increment extends GenericEvent {}

// create bloc class

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

- implement the bloc to your widget:
```dart


class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    //get the bloc using di or whatever way you use...
    //eg:
    final bloc = getIt<CounterBloc>();

    return BlocProvider(
        create: (context) => bloc,
        //make BlocBuilder with generic 
        child: BlocBuilder<CounterBloc, SimpleGenericState<int?>>(
          builder: (context, state) {

            

            return Column(
              children: [
                Text(
                  'You clicked ${state.value} times',
                ),
                TextButton(
                  onPressed: () {
                    //call event
                    bloc.add(Increment());
                  },
                  child: Text('Increment'),
                )
              ],
            );
          },
        ));
  }
}



```

