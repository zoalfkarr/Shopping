import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'theme_event.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState(isDarkMode: false)) {
    on<LoadThemeEvent>((event, emit) async {
      final prefs = await SharedPreferences.getInstance();
      final isDark = prefs.getBool('isDarkMode') ?? false;
      emit(ThemeState(isDarkMode: isDark));
    });
    on<ToggleThemeEvent>((event, emit) async {
      final currentMode = state.isDarkMode;
      final newMode = !currentMode;

      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isDarkMode', newMode);

      emit(ThemeState(isDarkMode: newMode));
    });
  }
}
