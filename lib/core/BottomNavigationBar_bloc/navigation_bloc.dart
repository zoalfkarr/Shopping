import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping/core/BottomNavigationBar_bloc/navigation_event.dart';
import 'package:shopping/core/BottomNavigationBar_bloc/navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(NavigationState(0)) {
    on<TabChanged>((event, emit) {
      emit(NavigationState(event.index));
    });
  }
}
