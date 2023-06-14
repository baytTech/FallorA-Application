import 'package:freezed_annotation/freezed_annotation.dart';

part 'relevance_request.freezed.dart';
part 'relevance_request.g.dart';


@freezed
class HoroscopeRelevanceRequest with _$HoroscopeRelevanceRequest{
    const factory HoroscopeRelevanceRequest({
      required String sign1,
      required String sign2,
      required String gender1,
      required String gender2
    }) = _HoroscopeRelevanceRequest;

    factory HoroscopeRelevanceRequest.fromJson(Map<String, Object?> json)
      => _$HoroscopeRelevanceRequestFromJson(json);
}