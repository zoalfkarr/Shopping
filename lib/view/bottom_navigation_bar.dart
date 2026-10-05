import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping/core/BottomNavigationBar_bloc/navigation_bloc.dart';
import 'package:shopping/core/BottomNavigationBar_bloc/navigation_event.dart';
import 'package:shopping/core/BottomNavigationBar_bloc/navigation_state.dart';
import 'package:shopping/view/change_night_mode.dart';
import 'package:shopping/view/shopping_home.dart';

class MainHomeScreen extends StatelessWidget {
  MainHomeScreen({super.key});

  final List<Widget> _pages = [
    const ShoppingHome(),
    const Center(child: Text('History')),
    const ChangeNightMode(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: Text('Shopping List'), centerTitle: true),

          body: _pages[state.currentIndex],

          bottomNavigationBar: BottomNavigationBar(
            currentIndex: state.currentIndex,
            onTap: (index) {
              context.read<NavigationBloc>().add(TabChanged(index));
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.grid_view_rounded),
                label: 'Grid',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.history_outlined),
                label: 'History',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Settings',
              ),
            ],
          ),
        );
      },
    );
  }
}
