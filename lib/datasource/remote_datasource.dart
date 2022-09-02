import 'package:blogweb/models/post_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class RemoteDatasource {

  Future<List<PostModel>> getPosts() async {
    final datas = <PostModel>[];
    var response = await Dio().get(
        'https://jsonplaceholder.typicode.com/posts',
      options: Options(
        headers: {
          'Content-type' : 'application/json'
        },
      )
    );
    if(response.statusCode == 200) {
      response.data.forEach((e) {
        datas.add(PostModel.fromJson(e));
      });
    }
    return datas;
  }
}