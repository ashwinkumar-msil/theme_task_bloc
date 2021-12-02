import 'package:flutter/material.dart';

@immutable
abstract class ThemeEvent {}

class ThemeToggle extends ThemeEvent {
  final ThemeMode Theme;

  ThemeToggle(this.Theme);
}
