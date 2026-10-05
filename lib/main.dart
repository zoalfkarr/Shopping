import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping/core/BottomNavigationBar_bloc/navigation_bloc.dart';
import 'package:shopping/core/Night_Mode/theme_event.dart';
import 'package:shopping/core/Night_Mode/theme_state.dart';
import 'package:shopping/view/bottom_navigation_bar.dart';

import 'core/product_cubit/product_cubit.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<NavigationBloc>(create: (context) => NavigationBloc()),

        BlocProvider<ProductCubit>(create: (context) => ProductCubit()),

        BlocProvider<ThemeBloc>(
          create: (context) => ThemeBloc()..add(LoadThemeEvent()),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: state.isDarkMode ? ThemeMode.dark : ThemeMode.light,
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          home: MainHomeScreen(),
        );
      },
    );
  }
}
