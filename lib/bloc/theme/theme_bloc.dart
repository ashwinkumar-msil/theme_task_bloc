import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'theme_event.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeMode> {
  ThemeBloc() : super(ThemeMode.light) {
    on<ThemeEvent>((event, emit) {
      if (event is ThemeToggle) {
        emit(event.Theme);
      }
    });
  }
}
