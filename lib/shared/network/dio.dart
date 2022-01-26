import 'package:dio/dio.dart';

class NewsApiServices {
  // String url =
  //     'https://newsapi.org/v2/top-headlines?country=us&apiKey=cd41a6a027a2461db8479c2f140bba20';

  static Dio? dio;

  static void init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://newsapi.org/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String path,
    required Map<String, dynamic> query,
  }) async {
    return await dio!.get(
      path,
      queryParameters: query,
    );
  }
}
