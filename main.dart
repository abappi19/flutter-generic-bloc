import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_builder/router.dart';
import 'package:portfolio_builder/src/bloc/generic_bloc.dart';
import 'package:portfolio_builder/src/bloc/theme/theme_bloc.dart';
import 'package:portfolio_builder/src/utils/theme_list.dart';
import 'injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final router = AppRouter();
    final bloc = getIt<ThemeBloc>();

    // return MaterialApp.router(routerConfig: router.config());

    Brightness brightness = MediaQuery.platformBrightnessOf(context);

    ThemeItem defaultTheme;
    if (brightness == Brightness.dark) {
      defaultTheme = ThemeList.MaterialDark;
    } else {
      defaultTheme = ThemeList.MaterialLight;
    }

    bloc.add(LoadTheme());

    return BlocProvider(
        create: (context) => bloc,
        //make BlocBuilder with generic 
        child: BlocBuilder<ThemeBloc, SimpleGenericState<ThemeItem?>>(
          builder: (context, state) {
            ThemeItem theme = state.Is(SimpleGenericState.STATE_INITIAL)
                ? defaultTheme
                : state.value!;

            return MaterialApp(
              debugShowCheckedModeBanner: false,
              debugShowMaterialGrid: false,
              title: 'Portfolio Builder',
              theme: theme.themeData, //state.value,
              home: Router.withConfig(config: router.config()),
            );
          },
        ));
  }
}
