part of 'post_bloc.dart';

@immutable
abstract class PostEvent {}

class GetPosts extends PostEvent {
}

class SearchPosts extends PostEvent {
  final String value;
  SearchPosts({required this.value});
}
