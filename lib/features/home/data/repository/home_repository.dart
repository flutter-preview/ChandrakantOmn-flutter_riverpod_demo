import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod_demo/core/network/dio_exceptions.dart';
import 'package:flutter_riverpod_demo/features/home/data/api/home_api.dart';
import 'package:flutter_riverpod_demo/features/home/data/models/joke_model.dart';

class HomeRepository {
  final HomeApi _homeApi;
  HomeRepository(this._homeApi);
  Future<JokeModel> fetchJoke(int count) async {
    try {
      final res = await _homeApi.fetchJokesApiRequest();
      final jokeModel = JokeModel.fromJson(res);
      return jokeModel;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e);
      log(errorMessage.toString());
      rethrow;
    }
  }
}
