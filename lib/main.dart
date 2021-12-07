import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theme_task/data/apptheme.dart';
import 'package:theme_task/screen/tab_bar.dart';
import 'package:theme_task/src/string.dart';

import 'bloc/theme/theme_bloc.dart';

void main() => runApp(const HomePage());

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeMode>(
        builder: (context, state) {
       

          return MaterialApp(
            title: Strings.appTitle,
            theme: MyTheme.lightTheme,
            darkTheme: MyTheme.dartkTheme,
            themeMode: state,
            home: const TabBarScreen(),
          );
        },
      ),
    );
  }
}
