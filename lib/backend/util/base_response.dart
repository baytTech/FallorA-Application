import 'package:equatable/equatable.dart';

class BaseResponse<T> extends Equatable {
  final Status? status;
  final T? data;
  final String? message;

  const BaseResponse({required this.status, required this.data, required this.message});

  @override
  String toString() {
    return "$status?: BaseResponse(${data?.toString()}) Message: $message";
  }

  factory BaseResponse.fromJson(Map<String, dynamic> json) {
    T data = json["data"];
    String message = json["message"] ?? "";
    Status status = json["status"];
    return BaseResponse<T>(data: data, status: status, message: message);
  }

  Map<String, dynamic> toJson() {
    return {"data": data ?? "null", "message": message ?? "null", "status": status ?? "null"};
  }

  factory BaseResponse.success({required T data}) => BaseResponse<T>(status: Status.SUCCESS, data: data, message: null);

  factory BaseResponse.loading({T? data}) => BaseResponse<T>(status: Status.LOADING, data: data, message: null);

  factory BaseResponse.error({String message = ""}) =>
      BaseResponse<T>(status: Status.ERROR, data: null, message: message);

  factory BaseResponse.unknown({T? data}) => BaseResponse<T>(status: Status.INITIALIZE, data: data, message: null);

  @override
  List<Object?> get props => [status, data, message];
}

enum Status { INITIALIZE, LOADING, SUCCESS, ERROR, TERMINATE }