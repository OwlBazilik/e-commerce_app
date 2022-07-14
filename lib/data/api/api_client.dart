import 'package:food_app/utils/app_constants.dart';
import 'package:get/get.dart';
import 'dart:async';

class ApiClient extends GetConnect implements GetxService {
  late String token;
  final String appBaseUrl;
  late Map<String, String> _mainHeaders;

  ApiClient({required this.appBaseUrl}) {
    baseUrl = appBaseUrl;
    timeout = const Duration(seconds: 30);
    token = AppConstants.TOKEN;
    _mainHeaders = {
      'Content-type': 'application/json; charset=UTF-8',
      'Autorization': 'Bearer $token',
    };
  }
  Future<Response> getData(String uri) async {
    try {
      Response response = await get(uri);
      //print(uri);
      //print(response.statusCode);
      //print(response.statusText);
      //print(response.body);

      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}
