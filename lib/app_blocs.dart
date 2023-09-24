import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_app/app_events.dart';
import 'package:learning_app/app_states.dart';

class Appblocs extends Bloc<AppEvents, AppStates> {
  Appblocs() : super(InitStates()) {
    on<Increment>(((event, ask) {
      ask(AppStates(counter: state.counter + 1));
      print(state.counter);
    }));

    on<Decrement>(((event, ask) {
      ask(AppStates(counter: state.counter - 1));
      print(state.counter);
    }));
  }
}
