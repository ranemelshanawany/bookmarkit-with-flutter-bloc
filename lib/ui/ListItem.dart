import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'DetailsScreen.dart';

class ListItem {

  static buildListItem(int index, context, state) {
    return Container(
      height: 200,
      child: Card(
          child: InkWell(
        onTap: () {
          openNewsPage(index, context, state);
        },
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _buildText(index, context, state),
              _buildImage(index, context, state),
            ],
          ),
        ),
      )),
    );
  }

  static _buildText(int index, context, state) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _buildTitle(state.getBookmarksList()[index].title),
            _buildDescription(state.getBookmarksList()[index].description),
          ],
        ),
      ),
    );
  }

  static _buildTitle(String title) {
    return Text(
      title,
      overflow: TextOverflow.ellipsis,
      maxLines: 4,
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    );
  }

  static _buildDescription(String description) {
    return Text(description,
        overflow: TextOverflow.ellipsis,
        maxLines: 3,
        style: TextStyle(fontSize: 15, color: Colors.grey));
  }

  static _buildImage(int index, context, state) {
    return Container(
        padding: EdgeInsets.only(right: 12, top: 8, bottom: 8),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(state.getBookmarksList()[index].urlToImage,
              width: 150, height: 150, fit: BoxFit.cover),
        ));
  }

  static openNewsPage(int index, context, state) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            DetailScreen(bookmark: state.getBookmarksList()[index]),
      ),
    );
  }
}
