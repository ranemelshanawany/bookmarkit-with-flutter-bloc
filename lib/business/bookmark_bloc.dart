import '../data/bookmark_api.dart';
import '../data/bookmark.dart';
import 'dart:async';

class BookmarkBloc {
  final streamController = StreamController<List<Bookmark>>();

  Stream<List<Bookmark>> get bookmarkList {
    return streamController.stream;
  }

  fetchBookmark() async {
    List<Bookmark> bookmarksList = await BookmarksAPI().fetchBookmark();
    streamController.sink.add(bookmarksList);
  }

  dispose() {
    streamController.close();
  }
}
