import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../data/bookmark.dart';

class DetailScreen extends StatelessWidget {
  final Bookmark bookmark;

  DetailScreen({Key key, @required this.bookmark}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            _buildImage(),
            _buildTitle(),
            _spacing(20),
            _buildDescription(),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle()
  {
    return Text(
      bookmark.title,
      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildDescription()
  {
    return Text(
      bookmark.description,
      style: TextStyle(fontSize: 20),
    );
  }

  Widget _buildImage()
  {
    return Image.network(bookmark.urlToImage, fit: BoxFit.cover);
  }

  Widget _spacing(double size)
  {
    return SizedBox(
      height: size,
    );
  }
}
