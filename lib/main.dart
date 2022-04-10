import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/bloc/simple_bloc_observer.dart';
import 'package:flutter_task/screens/track_listing_view.dart';

void main() {
  BlocOverrides.runZoned(() => runApp(const MyApp()),
  blocObserver: SimpleBlocObserver());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trending',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TrackListingView(),
    );
  }
}