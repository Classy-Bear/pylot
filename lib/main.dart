import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:pylot/blocs/blocs.dart';
import 'package:pylot/models/models.dart';
import 'package:pylot/repositories/repositories.dart';
import 'package:pylot/screens/screens.dart';
import 'package:pylot/utils/utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final Repository repository = Repository(
    apiClient: ApiClient(
      httpClient: http.Client(),
    ),
  );
  BlocSupervisor.delegate =
      SimpleBlocDelegate(await HydratedBlocStorage.getInstance());
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<TabBloc>(
          create: (context) => TabBloc(),
        ),
        BlocProvider<PlanetsBloc>(
          create: (context) => PlanetsBloc(repository: repository),
        ),
        BlocProvider<QuestionBloc>(
          create: (context) => QuestionBloc(repository: repository),
        ),
        BlocProvider<QuizzesBloc>(
          create: (context) => QuizzesBloc(repository: repository),
        ),
        BlocProvider<ThemeBloc>(
          create: (context) => ThemeBloc(),
        ),
        BlocProvider<AnimationsBloc>(
          create: (context) => AnimationsBloc(),
        ),
      ],
      child: MyApp(),
    // Uncomment the following line of code to use Device Preview
    // child: DevicePreview(builder: (context) => MyApp()),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(builder: (context, state) {
      if (state is ThemeLoaded) {
        var theme = state.themeModel;
        return Main(appThemeData[theme.theme]);
      }
      return Main(appThemeData[AppTheme.LightBlue]);
    });
  }
}

class Main extends StatelessWidget {
  final theme;

  Main(this.theme) : assert(theme != null);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
//      locale: DevicePreview.of(context).locale, // <--- Add the locale
//      builder: DevicePreview.appBuilder, // <--- Add the builder
      initialRoute: StringResources.homeScreenId,
      routes: {
        StringResources.homeScreenId: (context) => HomeScreen(),
        StringResources.quizDetailScreenId: (context) => QuizDetailScreen(),
        StringResources.questionScreenId: (context) => QuestionScreen(),
        StringResources.planetScreenId: (context) => PlanetsScreen(),
        StringResources.webPlanetScreenId: (context) => WebPlanetScreen(),
        StringResources.planetDetailsScreenId: (context) =>
            PlanetDetailsScreen(),
      },
    );
  }
}
