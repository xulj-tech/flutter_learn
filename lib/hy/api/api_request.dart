import 'package:dio/dio.dart';
import 'dart:convert' as convert;

class ApiRequest {
  static const int timeout = 5000;
  static Dio dio ;

  static setBaseUrl(String ip,String port,{String url}){
    String baseURL = "http://$ip:$port/";
    if(url!=null && url.isNotEmpty){
      baseURL=url;
    }
    BaseOptions baseOptions =
    BaseOptions(baseUrl: baseURL, connectTimeout: timeout);
    dio = Dio(baseOptions);
  }

  static Future<Map<String, dynamic>> request<T>(String url,
      {String method = "get",
        data,
        Map<String, dynamic> params,
        Interceptor inter}) async {

    final options = Options(method: method);

    // 创建默认的全局拦截器
    Interceptor dInter = InterceptorsWrapper(onRequest: (options) {
      print("\n================== 请求数据 ==========================");
      print("url = ${options.uri.toString()}");
      print("method = ${options.method}");
      print("headers = ${options.headers}");
      print("params = ${convert.jsonEncode(options.data)}");
      return options;
    }, onResponse: (response) {
      print("\n================== 响应数据 ==========================");
      print("code = ${response.statusCode}");
      print("data = ${convert.jsonEncode(response.data)}");
      return response;
    }, onError: (e) {
      print("\n================== 错误响应数据 ======================");
      print("type = ${e.type}");
      print("message = ${e.message}");
      return e;
    });

    List<Interceptor> inters = [dInter];

    // 请求单独拦截器
    if (inter != null) {
      inters.add(inter);
    }

    // 统一添加到拦截器中
    dio.interceptors.addAll(inters);

    Response<Map<String, dynamic>> response;

    if (method == 'POST' || method == 'post') {
      try {
        response = await dio.post(url, queryParameters: params, data:data,options: options);
        return response.data;
      } on DioError catch (e) {
        return Future.error(e);
      }
    } else {
      try {
        response = await dio.get(url, queryParameters: params, options: options);
        return response.data;
      } on DioError catch (e) {
        return Future.error(e);
      }
    }


  }



}
