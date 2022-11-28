import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:itlwebapp/core/api/config/config.dart';

class ApiRequest {
  String? requestUrl;
  dynamic body;
  dynamic queryParameter;

  ApiRequest({
     this.requestUrl,
    this.body,
    this.queryParameter,
  });

  static Dio dio = Dio(BaseOptions(
      baseUrl: Config.BASE_URl,
      
      responseType: ResponseType.json));

  static final DioCacheManager _dioCacheManager = DioCacheManager(CacheConfig());
  static final Options _cacheOptions = buildCacheOptions(const Duration(days: 7),
      forceRefresh: true, maxStale: const Duration(days: 10));

  Future<Response?> postRequest() async {
    Response? response;
    // dio.options.headers["authorization"] = "Bearer ${Config.requestToken}";
    // print(Config.requestToken);

    try {
      response = await dio.post(requestUrl!, data: body, options: _cacheOptions);
      print(response);
      print('diooo response');
      dio.interceptors.add(_dioCacheManager.interceptor);
    } on DioError catch (e) {
      print('dio error');
      print(e);
      response = null;
      error(dioError: e, functionParameter: requestUrl);
    }
    return response;
  }

  static error({DioError? dioError, String? functionParameter, String? error}) {
    // Utils.displayErrorPrint(
    //     message: functionParameter + ' ' + dioError.response.toString());
    // Utils.showMessage(message: dioError.error.toString(), color: Colors.red);
  }

  static Future<Response> sendRequest(
      {required String requestUrlData,
      dynamic bodyData,
      dynamic queryParameterDat,
      bool? isPostRequest,
      RxInt? statusCode,
      RxBool? isFetching}) async {
        print('send req');
        print(requestUrlData);
        print(bodyData);
    statusCode!.value = 0;
    isFetching!(true);
    Response<dynamic>? responseData;
    ApiRequest apiService = ApiRequest();
    apiService.body = bodyData;
    apiService.requestUrl = requestUrlData;
    if (await checkIsConnectEstablish()) {
      // Utils.showMessage(
      //     message: "Please check your internet connection or try again later");
      statusCode.value = 300;
    } else {
      print('else api service');
      // print(apiService.postRequest());
      await apiService.postRequest().then((Response<dynamic>? response) async {
        print('api service');
      
        if (response != null) {
          Map<String, dynamic> output =
              Map<String, dynamic>.from(await response.data);
          if (response.statusCode == 200) {
            print('api 200');
            if (await response.data != null) {
              responseData = response;
            } else {
              statusCode.value = 401;
            }
          } else {
            print("error");
            //statusCode.value = output['status_code'];
          }
        } else {
          statusCode.value = 502;
        }
      }).catchError((error) => {print(error),
      print('api req error'),
      });
    }
    return responseData!;
  }

  static Future<bool> checkIsConnectEstablish() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    return connectivityResult == ConnectivityResult.none;
  }
}

