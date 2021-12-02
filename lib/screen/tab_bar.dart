import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theme_task/bloc/theme/theme_bloc.dart';
import 'package:theme_task/bloc/watchlist_bloc.dart';
import 'package:theme_task/bloc/watchlist_event.dart';
import 'package:theme_task/model/contact_data_model.dart';
import 'package:theme_task/service/contactrespo.dart';
import 'package:theme_task/src/string.dart';
import 'package:theme_task/widget/changethemebutton.dart';

import 'categoreis_screen.dart';

class TabBarScreen extends StatefulWidget {
  const TabBarScreen({Key? key}) : super(key: key);

  @override
  State<TabBarScreen> createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late WatchlistBloc watchlistBloc = WatchlistBloc(ContactService());
  ThemeBloc themeBloc = ThemeBloc();
  bool isLightTheme = false;

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: 4);
    watchlistBloc.add(FetchContactData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => watchlistBloc,
      child: DefaultTabController(
        length: Strings.name.length,
        child: Scaffold(
          appBar: AppBar(
            actions: [ThemeSelector()],
            title: const Text(
              Strings.title,
              style: TextStyle(fontSize: 20),
            ),
            bottom: TabBar(
              controller: _tabController,
              indicatorWeight: 4.0,
              indicatorColor: Colors.blue,
              tabs: Strings.name,
            ),
          ),
          body: BlocBuilder<WatchlistBloc, WatchlistState>(
            builder: (context, state) {
              if (state is Contactblocloading) {
                return const Text(Strings.loading);
              } else if (state is ContactFetchData) {
                List<Contact> contactdata = state.contacts;
                if (contactdata == []) {
                  return const Text(Strings.loading);
                } else {
                  return TabBarView(
                    controller: _tabController,
                    children: <Widget>[
                      CategoriesScreen(data: contactdata.sublist(0, 25)),
                      CategoriesScreen(data: contactdata.sublist(25, 50)),
                      CategoriesScreen(data: contactdata.sublist(50, 75)),
                      CategoriesScreen(data: contactdata.sublist(75)),
                    ],
                  );
                }
              } else if (state is ContactError) {
                return const Text(Strings.unknownError);
              } else {
                return const Text(Strings.unknownError);
              }
            },
          ),
        ),
      ),
    );
  }
}
