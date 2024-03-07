import 'dart:developer';

import 'package:blocapi/data/models/post_model.dart';
import 'package:dio/dio.dart';

import 'api/api.dart';

class PostRepository{

  API api = API();

  Future<Iterable<PostModel>> fetchPosts() async {
    try{
      Response response = await api.sendRequest.get("/posts");
      List<dynamic> postMaps = response.data;
      return postMaps.map((postMap) => PostModel.fromJson(postMap)).toList();
      // log(response.data);
    }
    catch(ex){
      throw ex;
    }

  }
}