import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:blogweb/datasource/remote_datasource.dart';
import 'package:blogweb/models/post_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final RemoteDatasource dataSource;

  PostBloc(this.dataSource) : super(PostState()) {
    on<PostEvent>((event, emit) async {
      if(event is GetPosts) {
        emit(state.copyWith(isLoading: true, isError: false));
        try {
          final datas = await dataSource.getPosts();
          emit(state.copyWith(isLoading: false, defaultDatas: datas, datas: datas, message: 'success'));
        } catch (e) {
          if(e is DioError) {
            debugPrint('Dio Error -> ${e.message}');
            emit(state.copyWith(isLoading: false, isError: true, message: e.message));
          } else {
            debugPrint('Error -> $e');
            emit(state.copyWith(isLoading: false, isError: true, message: 'unknown error, please try again'));
          }
        }
      } else if(event is SearchPosts) {
        emit(state.copyWith(isLoading: true, isError: false));
        try {
          if(state.defaultDatas == null || state.defaultDatas!.isEmpty) {
            emit(state.copyWith(isLoading: false, isError: true, message: 'post not found'));
          } else {
            final datas = state.defaultDatas!.where((e) => e.title.toLowerCase().contains(event.value.toLowerCase())).toList();
            emit(state.copyWith(isLoading: false, datas: datas, message: null));
          }
        } catch (e) {
          debugPrint('Error -> $e');
          emit(state.copyWith(isLoading: false, isError: true, message: 'unknown error, please try again'));
        }
      }
    });
  }
}
