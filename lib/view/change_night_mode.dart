import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping/core/Night_Mode/theme_event.dart';
import 'package:shopping/core/Night_Mode/theme_state.dart';

class ChangeNightMode extends StatefulWidget {
  const ChangeNightMode({super.key});

  @override
  State<ChangeNightMode> createState() => _ChangeNightModeState();
}

class _ChangeNightModeState extends State<ChangeNightMode> {
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text("Night / Light Mode", style: TextStyle(fontSize: 18)),
          Switch(
            value: isDark,
            onChanged: (value) {
              context.read<ThemeBloc>().add(ToggleThemeEvent());
            },
          ),
        ],
      ),
    );
  }
}
