import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theme_task/bloc/theme/theme_bloc.dart';
import 'package:theme_task/bloc/theme/theme_event.dart';
import 'package:theme_task/src/string.dart';

class ThemeSelector extends StatelessWidget {
  const ThemeSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeBloc = BlocProvider.of<ThemeBloc>(context);
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: PopupMenuButton(
        itemBuilder: (ctx) => [
          PopupMenuItem(
            onTap: () {
              themeBloc.add(ThemeToggle(ThemeMode.light));
            },
            child: Row(
              children: [
                Icon(
                  Icons.light_mode,
                  color: Theme.of(context).primaryColorDark,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    Strings.lightmode,
                  ),
                ),
              ],
            ),
          ),
          PopupMenuItem(
            onTap: () {
              themeBloc.add(ThemeToggle(ThemeMode.dark));
            },
            child: Row(
              children: [
                Icon(
                  Icons.dark_mode,
                  color: Theme.of(context).primaryColorDark,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    Strings.darkmode,
                  ),
                ),
              ],
            ),
          ),
          PopupMenuItem(
            onTap: () {
              themeBloc.add(ThemeToggle(ThemeMode.system));
            },
            child: Row(
              children: [
                Icon(
                  Icons.dark_mode_outlined,
                  color: Theme.of(context).primaryColorDark,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    Strings.defalutmode,
                  ),
                ),
              ],
            ),
          )
        ],
        child: BlocBuilder<ThemeBloc, ThemeMode>(
          builder: (context, state) {
            if (state == ThemeMode.dark) {
              return const Icon(
                Icons.dark_mode,
              );
            } else if (state == ThemeMode.light) {
              return const Icon(
                Icons.light_mode,
              );
            } else {
              return const Icon(
                Icons.dark_mode_outlined,
              );
            }
          },
        ),
      ),
    );
  }
}
