import 'package:fallora/backend/model/birthdate/birth_date_request.dart';
import 'package:fallora/backend/model/birthdate/birth_date_response.dart';
import 'package:fallora/backend/model/fortune/fortune.dart';
import 'package:fallora/backend/model/horoscope_reading/horoscope_reading.dart';
import 'package:fallora/backend/model/horoscope_relevance/horoscope_relevance.dart';
import 'package:fallora/backend/model/horoscope_request/relevance_request.dart';
import 'package:fallora/backend/model/login/request/login_request.dart';
import 'package:fallora/backend/model/login/response/login_response.dart';
import 'package:fallora/backend/model/otp/sendotp/send_otp_request.dart';
import 'package:fallora/backend/model/otp/verifyotp/verify_otp_request.dart';
import 'package:fallora/backend/model/register/request/register_request.dart';
import 'package:fallora/backend/model/tarot/tarot.dart';
import 'package:fallora/backend/model/user/user.dart';
import 'package:fallora/backend/service/functions.service.dart';
import 'package:fallora/backend/util/base_response.dart';
import 'package:fallora/backend/util/network_handler.dart';


abstract class FunctionsRepo {
  Future<BaseResponse<HoroscopeReading>> getHoroscopeReadings(String gender, String sign);
  Future<BaseResponse<List<Tarot>>> suffleTarrots();
  Future<BaseResponse<Fortune>> getCoffeeFortune();
  Future<BaseResponse<HoroscopeRelevance>> horoscopeRelevance(HoroscopeRelevanceRequest body);
  Future<BaseResponse<LoginResponse>> login(LoginRequest body);
  Future<BaseResponse<String?>> register(RegisterRequest body);
  Future<BaseResponse<String?>> sendOtp(SendOtpRequest body);
  Future<BaseResponse<String?>> verifyOtp(VerifyOtpRequest body);
  Future<BaseResponse<User>> profile();
  Future<BaseResponse<BirthDateResponse>> updateBirthDate(BirthDateRequest body);

}

class FunctionsRepoImpl implements FunctionsRepo {
  final FunctionsService service;

  const FunctionsRepoImpl(this.service);

  @override
  Future<BaseResponse<HoroscopeReading>> getHoroscopeReadings(String gender, String sign){
    return NetworkHandler.getSafeResult(service.getHoroscopeReading(gender, sign));
  }
  
  @override
  Future<BaseResponse<Fortune>> getCoffeeFortune() {
    return NetworkHandler.getSafeResult(service.getCoffeeFortune());
  }
  
  @override
  Future<BaseResponse<HoroscopeRelevance>> horoscopeRelevance(HoroscopeRelevanceRequest body) {
    return NetworkHandler.getSafeResult(service.horoscopeRelevance(body));
  }
  
  @override
  Future<BaseResponse<List<Tarot>>> suffleTarrots() {
    return NetworkHandler.getSafeResult(service.suffleTarrots());
  }
  
  @override
  Future<BaseResponse<LoginResponse>> login(LoginRequest body) {
    return NetworkHandler.getSafeResult(service.login(body));
  }
  
  @override
  Future<BaseResponse<String?>> register(RegisterRequest body) {
    return NetworkHandler.getSafeResult(service.register(body));
  }
  
  @override
  Future<BaseResponse<String?>> sendOtp(SendOtpRequest body) {
    return NetworkHandler.getSafeResult(service.sendOtp(body));
  }
  
  @override
  Future<BaseResponse<String?>> verifyOtp(VerifyOtpRequest body) {
    return NetworkHandler.getSafeResult(service.verifyOtp(body));
  }
  
  @override
  Future<BaseResponse<User>> profile() {
    return NetworkHandler.getSafeResult(service.profile());
  }
  
  @override
  Future<BaseResponse<BirthDateResponse>> updateBirthDate(BirthDateRequest body) {
    return NetworkHandler.getSafeResult(service.updateBirthDate(body));
  }
}
