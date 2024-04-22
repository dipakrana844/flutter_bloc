import 'package:bloc/bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);
  /// increment method
  void increment() => emit(state + 1);
  /// decrement method
  void decrement() => emit(state - 1);
}
