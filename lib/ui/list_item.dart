import 'package:bookmark_list_app/data/bookmark.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'details_screen.dart';

class ListItem {
  static buildListItem(int index, context, List<Bookmark> bookmarks) {
    return Container(
      height: 200,
      child: Card(
          child: InkWell(
        onTap: () {
          openNewsPage(index, context, bookmarks);
        },
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _buildText(index, bookmarks),
              _buildImage(index, bookmarks),
            ],
          ),
        ),
      )),
    );
  }

  static _buildText(int index, List<Bookmark> bookmarks) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _buildTitle(bookmarks[index].title),
            _buildDescription(bookmarks[index].description),
          ],
        ),
      ),
    );
  }

  static _buildTitle(String title) {
    return Text(
      title,
      overflow: TextOverflow.ellipsis,
      maxLines: 3,
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    );
  }

  static _buildDescription(String description) {
    return Text(description,
        overflow: TextOverflow.ellipsis,
        maxLines: 3,
        style: TextStyle(fontSize: 15, color: Colors.grey));
  }

  static _buildImage(int index, List<Bookmark> bookmarks) {
    return Container(
        padding: EdgeInsets.only(right: 12, top: 8, bottom: 8),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(bookmarks[index].urlToImage,
              width: 150, height: 150, fit: BoxFit.cover),
        ));
  }

  static openNewsPage(int index, context, List<Bookmark> bookmarks) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailScreen(bookmark: bookmarks[index]),
      ),
    );
  }
}
