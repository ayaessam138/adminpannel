


import 'package:afcooadminpanel/Core/utility.dart';
import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(BaseOptions(
      connectTimeout: Duration(minutes: 10),
      receiveTimeout: Duration(minutes: 10),

      baseUrl: "http://192.168.1.250/api/",
      receiveDataWhenStatusError: true,
      followRedirects: false,
      validateStatus: (status) {
        return true;
      },
      // connectTimeout: 60 * 1000 ,
      // 60 seconds
      // receiveTimeout: 60 * 1000 ,
    ));
  }

  static Future<Response> getData({
    required url,
    Map<String, dynamic>? qurey,
    String? token,
    String? apiToken,
  }
      /////////////////////
      ) async {
    dio.options.headers = {
      'Authorization': token,
      "api-token": apiToken ?? "TESTPOSTMAN",
    };
    // Utility.myPrintX(url);
    // Utility.myPrintX("TOKEN_$token");
    return await dio.get(url, queryParameters: qurey);
  }

  static Future<Response> DeleteData({
    required url,
    Map<String, dynamic>? qurey,
    Map<String, dynamic>? data,
    String? token,
    String? apiToken,
  }
      /////////////////////
      ) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': token,
      "api-token": apiToken ?? "TESTPOSTMAN",
    };

    return await dio.delete(url, queryParameters: qurey, data: data);
  }
//////////////////////////

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? data,
    // Map<String, dynamic>? query,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
    String? apiToken,
  }) async {
    dio.options.headers = {
      'lang': lang,
      'Authorization': token,
      "api-token": apiToken ?? "TESTPOSTMAN",
      'Content-Type': 'application/json',
    };
    Utility.myPrintX('query');
    Utility.myPrintX(query);
    return dio.post(
      url,
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> postDataFormat({
    required String url,
    required Map<String,dynamic> data,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
  }) async {
    dio.options.headers = {
      'lang': lang,
      'Authorization': "Bearer $token" ?? 'Bearer test',
      "api-token": "TESTPOSTMAN",
      // 'Content-Type': 'multipart/form-data',
    };

    return dio.post(
      url,
      queryParameters: query,
      data: FormData.fromMap(data),
    );
  }

  static Future<Response> putData({
    required String url,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
  }) async {
    dio.options.headers = {
      'lang': lang,
      'Authorization': token ?? '',
      "api-token": "TESTPOSTMAN",

    };

    return dio.put(
      url,
      queryParameters: query,
      data: data,
    );
  }
}

const DeafultPageSize = 10000;
