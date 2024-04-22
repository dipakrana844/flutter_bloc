import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_test/counter_observer.dart';
import 'package:flutter_bloc_test/flutter_infinite_list/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = const CounterBlocObserver();
  // runApp( const CounterApp());
  // runApp( const TimerApp());
  runApp(const InfiniteApp());
}
