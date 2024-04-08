import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_bloc/bloc/counter_bloc.dart';
import 'package:watch_bloc/page/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter BLoC Example',
      home: BlocProvider(
        create: (context) => CounterBloc(),
        child: HomePage(),
      ),
    );
  }
}
