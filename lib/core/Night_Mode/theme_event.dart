abstract class ThemeEvent {}

class ToggleThemeEvent extends ThemeEvent {}

class LoadThemeEvent extends ThemeEvent {}

class ThemeState {
  final bool isDarkMode;
  ThemeState({required this.isDarkMode});
}
