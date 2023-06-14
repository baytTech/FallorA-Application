import 'package:dio/dio.dart';
import 'package:fallora/backend/util/base_response.dart';

abstract class NetworkHandler {
  static Future<BaseResponse<T>> getSafeResult<T>(Future<T> call) async {
    try {
      var response = await call;
      return BaseResponse.success(data: response);
    } catch (e) {
      if (e is DioError) {
        switch (e.type) {
          case DioErrorType.connectionTimeout:
          case DioErrorType.cancel:
          case DioErrorType.receiveTimeout:
          case DioErrorType.sendTimeout:
          case DioErrorType.badResponse:
            return BaseResponse.error(message: e.response.toString());
          default:
            return BaseResponse.error(message: e.message.toString());
        }
      }
      return BaseResponse.error(message: e.toString());
    }
  }
}