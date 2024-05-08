import 'package:portfolio_builder/injection.dart';
import 'package:portfolio_builder/generic_bloc.dart';
import 'package:portfolio_builder/data/service/app_service.dart';

class SetTheme extends GenericEvent {
  ThemeItem themeItem;
  SetTheme(this.themeItem);
}

class LoadTheme extends GenericEvent {}


//extend bloc to SimpleGenericBloc
class ThemeBloc extends SimpleGenericBloc<ThemeItem?> {
  ThemeItem? themeItem;

  ThemeBloc() : super(SimpleGenericState.initial(null)) {
    AppService app = getIt<AppService>();

    on<GenericEvent>((event, emit) async {
      if (event is SetTheme) {
        themeItem = event.themeItem;
        emit(SimpleGenericState.update(themeItem));
        
        //do your action to update local storage data
        //eg: 
        //app.updateSavedThemeName(event.themeItem.title);


      }
      if (event is LoadTheme) {

        //load theme from local storage:
        //eg:
        
        /*
            String? themeName = await app.getSavedThemeName();
            if (themeName == null) {
            return;
            }
            themeItem = ThemeList.themes
                .firstWhere((element) => element.title == themeName);
            emit(SimpleGenericState.update(themeItem));
        */


      }
    });
  }
}
