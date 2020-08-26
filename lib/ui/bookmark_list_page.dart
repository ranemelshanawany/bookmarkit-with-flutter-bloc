import 'package:bookmark_list_app/data/bookmark.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'list_item.dart';

class BookmarkListPage extends StatelessWidget {
  final List<Bookmark> bookmarks;

  BookmarkListPage(this.bookmarks);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: bookmarks.length,
      itemBuilder: (context, index) {
        return ListItem.buildListItem(index, context, bookmarks);
      },
    );
  }
}
