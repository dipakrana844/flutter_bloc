import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_test/counter_observer.dart';
import 'package:flutter_bloc_test/flutter_login/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = const CounterBlocObserver();

  // final ImageDataSource dataSource = ImageDataSourceImpl(dio: Dio());
  // final ImageRepository repository =
  //     ImageRepositoryImpl(dataSource: dataSource);
  // final FetchImagesUseCase useCase = FetchImagesUseCase(repository);
  // final ImageBloc bloc = ImageBloc(imagesUseCase: useCase);
  // runApp( const CounterApp());
  // runApp( const TimerApp());
  // runApp(const InfiniteApp());
  // runApp(ImageSearchApp(bloc: bloc));
  runApp(const FlutterLogin());
}
