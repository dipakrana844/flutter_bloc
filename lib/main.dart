import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_test/counter_observer.dart';
import 'package:flutter_bloc_test/image_search/app.dart';
import 'package:flutter_bloc_test/image_search/data/datasources/remote/image_datasource.dart';
import 'package:flutter_bloc_test/image_search/data/datasources/remote/image_datasource_impl.dart';
import 'package:flutter_bloc_test/image_search/data/repositories/image_repository_impl.dart';
import 'package:flutter_bloc_test/image_search/domain/repositories/image_repository.dart';
import 'package:flutter_bloc_test/image_search/domain/use_cases/image_use_case.dart';
import 'package:flutter_bloc_test/image_search/presentation/bloc/image_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = const CounterBlocObserver();
  final ImageDataSource dataSource = ImageDataSourceImpl(dio: Dio());
  final ImageRepository repository =
      ImageRepositoryImpl(dataSource: dataSource);
  final FetchImagesUseCase useCase = FetchImagesUseCase(repository);
  final ImageBloc bloc = ImageBloc(imagesUseCase: useCase);
  // runApp( const CounterApp());
  // runApp( const TimerApp());
  // runApp(const InfiniteApp());
  runApp(
    ImageSearchApp(bloc: bloc),
  );
}
