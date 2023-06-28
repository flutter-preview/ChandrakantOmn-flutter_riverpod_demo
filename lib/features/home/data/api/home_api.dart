import 'package:flutter_riverpod_demo/core/network/constant/endpoints.dart';
import 'package:flutter_riverpod_demo/core/network/dio_client.dart';

class HomeApi {
  // dio instance
  final DioClient _dioClient;

  // injecting dio instance
  HomeApi(this._dioClient);

  Future<Map<String, dynamic>> fetchJokesApiRequest() async {
    try {
      final res = await _dioClient.get(Endpoints.baseUrl);
      return res.data;
    } catch (e) {
      rethrow;
    }
  }
}
