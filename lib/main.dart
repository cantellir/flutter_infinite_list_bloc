import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_list/bloc/post_bloc.dart';
import 'package:infinite_list/bloc/post_event.dart';
import 'package:infinite_list/home.dart';
import 'package:infinite_list/simple_bloc_delegate.dart';
import 'package:bloc/bloc.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Infinite Scroll',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text('Posts'),
          ),
          body: BlocProvider(
            builder: (context) =>
                PostBloc(httpClient: http.Client())..add(Fetch()),
            child: HomePage(),
          ),
        ));
  }
}
