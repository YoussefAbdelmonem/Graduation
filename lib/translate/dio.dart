
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';
class DioHelper {
  static late Dio _dio;

  static init() {
    _dio = Dio(
      BaseOptions(
        baseUrl: 'https://7f5e-105-197-135-143.ngrok-free.app/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getExprimentData({
    required String url,
    Map<String, dynamic>? query,
    Map<String, String>? headers,
    // String uuid = '',
    // String token = '',
  }) async {
    //set headers here
    _dio.options.headers = headers;
    return await _dio.get(url,queryParameters: query);
  }

  static Future<Response> postData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,

  }) async {
    _dio.options.headers = {
      // 'Content-Type': 'application/json',
    };

    return await _dio.post(url, data: data, queryParameters: query);
  }
  static Future<Response> postFile({
    required String url,
    Map<String, dynamic>? query,
    required String filePath,
    required String fileName
  })async{
    _dio.options.headers={
      "Content-Type" : "multipart/form-data"
    };
FormData formData =  FormData.fromMap({
  'wavfile':await MultipartFile.fromFile(filePath,
      filename: fileName,
      contentType: MediaType("audio","wav")
  )
});
print("yourdata"+formData.toString());
    return await _dio.post(url, data:formData , queryParameters: query);
  }
  // post data
  static Future<Response> putData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    String lang = 'en',
    String token = '',
  }) async {
    // set headers here
    _dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token,
    };
    return await _dio.put(url, data: data, queryParameters: query);
  }
  static Future<Response> getHomeData({
    required String url,
    Map<String, dynamic>? query,
    // String lang = 'en',
    // String token = '',
  }) async {
    // set headers here
    _dio.options.headers = {
      'Content-Type': 'application/json',
      // 'lang': lang,
      // 'Authorization': token,
    };
    return await _dio.get(url, queryParameters: query);
  }


}