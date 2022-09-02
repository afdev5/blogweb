part of 'post_bloc.dart';

class PostState {
  final bool isLoading;
  final bool isError;
  final String? message;
  final List<PostModel>? defaultDatas;
  final List<PostModel>? datas;

  PostState(
      {this.isLoading = false,
        this.message,
        this.datas,
        this.defaultDatas,
        this.isError = false});

  PostState copyWith(
      {bool? isLoading,
        String? message,
        List<PostModel>? datas,
        List<PostModel>? defaultDatas,
        bool? isError}) {
    return PostState(
        datas: datas ?? this.datas,
        message: message ?? this.message,
        isLoading: isLoading ?? this.isLoading,
        defaultDatas: defaultDatas ?? this.defaultDatas,
        isError: isError ?? this.isError);
  }
}
