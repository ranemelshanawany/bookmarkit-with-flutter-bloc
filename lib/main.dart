import 'package:flutter/material.dart';
import 'business/bookmark_bloc.dart';
import 'data/bookmark.dart';
import 'ui/bookmark_list_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BookmarkBloc bookmarkBloc = BookmarkBloc();
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Bookmarks List")),
        body: StreamBuilder(
            stream: bookmarkBloc.bookmarkList,
            builder:
                (BuildContext context, AsyncSnapshot<List<Bookmark>> snapshot) {
              bookmarkBloc.fetchBookmark();
              if (snapshot.connectionState == ConnectionState.active) {
                List<Bookmark> bookmarks = snapshot.data;
                return BookmarkListPage(bookmarks);
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
