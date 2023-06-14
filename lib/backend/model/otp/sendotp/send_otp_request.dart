import 'package:freezed_annotation/freezed_annotation.dart';

part 'send_otp_request.freezed.dart';
part 'send_otp_request.g.dart';

@freezed
class SendOtpRequest with _$SendOtpRequest {
  const factory SendOtpRequest({
    required String email,
  }) = _SendOtpRequest;

  factory SendOtpRequest.fromJson(Map<String, Object?> json) =>
      _$SendOtpRequestFromJson(json);
}
