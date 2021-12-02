import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theme_task/bloc/theme/theme_bloc.dart';
import 'package:theme_task/bloc/theme/theme_event.dart';

class ThemeSelector extends StatelessWidget {
  const ThemeSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeBloc = BlocProvider.of<ThemeBloc>(context);
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: PopupMenuButton(
        key: const ValueKey('ThemeSelector'),
        itemBuilder: (ctx) => [
          PopupMenuItem(
            key: const ValueKey('lightMode'),
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
                    "lightMode",
                  ),
                ),
              ],
            ),
          ),
          PopupMenuItem(
            key: const ValueKey('darkMode'),
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
                    "darkMode",
                  ),
                ),
              ],
            ),
          ),
          PopupMenuItem(
            key: const ValueKey('systemDefault'),
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
                    "systemDefault",
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
                key: ValueKey('darkIcon'),
              );
            } else if (state == ThemeMode.light) {
              return const Icon(
                Icons.light_mode,
                key: ValueKey('lightIcon'),
              );
            } else {
              return const Icon(
                Icons.dark_mode_outlined,
                key: ValueKey('systemIcon'),
              );
            }
          },
        ),
      ),
    );
  }
}
