import '../business/BookmarkBloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'ListItem.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookmarkListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    getAPI(context);

    return BlocBuilder<BookmarkBloc, BookmarkState>(builder: (context, state) {
      if (state is Loading) {
        return Center(child: CircularProgressIndicator());
      }
      else if (state is Loaded) {
        return ListView.builder(
          itemCount: state.getBookmarksList().length,
          itemBuilder: (context, index) {
            return ListItem.buildListItem(index, context, state);
          },
        );
      }
      return Text("Error");
    });
  }

  getAPI(context) async {
    BlocProvider.of<BookmarkBloc>(context).add(FetchBookmarks());
  }
}
