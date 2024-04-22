import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_test/image_search/presentation/bloc/image_bloc.dart';
import 'package:flutter_bloc_test/image_search/presentation/screens/home_screen/home_screen.dart';

class ImageSearchApp extends StatelessWidget {
  final ImageBloc bloc;
  const ImageSearchApp({super.key, required this.bloc});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => bloc,
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Image Search',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const ImageScreen(),
      ),
    );
  }
}
