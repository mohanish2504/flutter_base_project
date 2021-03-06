import 'package:base_project/bloc/user_bloc.dart';
import 'package:base_project/screens/home/home.dart';
import 'package:base_project/utils/constants.dart';
import 'package:base_project/utils/size_config.dart';
import 'package:base_project/utils/strings.dart';
import 'package:base_project/utils/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [BlocProvider(create: (_) => UserBloc())],
        child: const _App());
  }
}

class _App extends StatefulWidget {
  const _App({Key? key}) : super(key: key);

  @override
  State<_App> createState() => _AppState();
}

class _AppState extends State<_App> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        SizeConfig().init(constraints, orientation);

        return MaterialApp(

          home: Home(Strings.homeScreenLabels.appBarTitle),
          theme: AppThemeData.getThemeData().generalThemeData,
          darkTheme: AppThemeData.getThemeData(isDark: true).generalThemeData,
          themeMode: Constants.isDark ? ThemeMode.dark:ThemeMode.light,
          routes: {

          },
        );
      });
    });
  }
}
