import 'package:flutter/material.dart';
import 'business/BookmarkBloc.dart';
import 'ui/BookmarkListPage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(BlocProvider(
      create: (BuildContext context) => BookmarkBloc(Loading()),
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Bookmarks List")),
        body: BookmarkListPage(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
