import '../data/BookmarkAPI.dart';
import '../data/bookmark.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

class BookmarkEvents extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchBookmarks extends BookmarkEvents {}

class BookmarkState extends Equatable {
  @override
  List<Object> get props => [];
}

class Loading extends BookmarkState {}

class Loaded extends BookmarkState {
  final bookmarks;

  Loaded(this.bookmarks);

  List<Bookmark> getBookmarksList()
  {
    return bookmarks;
  }
}

class NotLoaded extends BookmarkState {}

class BookmarkBloc extends Bloc<BookmarkEvents, BookmarkState> {

  BookmarkBloc(BookmarkState initialState) : super(Loading());

  @override
  Stream<BookmarkState> mapEventToState(BookmarkEvents event) async* {
    // TODO: implement mapEventToState
    List<Bookmark> bookmarks = new List();

    if (event is FetchBookmarks) {
      yield Loading();
      try {
        bookmarks = await BookmarksAPI().fetchBookmark();
        yield Loaded(bookmarks);
      } catch (e){
        yield NotLoaded();
      }
    }
  }
}
