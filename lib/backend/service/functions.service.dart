import 'package:dio/dio.dart';
import 'package:fallora/backend/config/app.constants.dart';
import 'package:fallora/backend/model/birthdate/birth_date_request.dart';
import 'package:fallora/backend/model/birthdate/birth_date_response.dart';
import 'package:fallora/backend/model/fortune/fortune.dart';
import 'package:fallora/backend/model/horoscope_reading/horoscope_reading.dart';
import 'package:fallora/backend/model/horoscope_relevance/horoscope_relevance.dart';
import 'package:fallora/backend/model/login/request/login_request.dart';
import 'package:fallora/backend/model/login/response/login_response.dart';
import 'package:fallora/backend/model/otp/sendotp/send_otp_request.dart';
import 'package:fallora/backend/model/otp/verifyotp/verify_otp_request.dart';
import 'package:fallora/backend/model/tarot/tarot.dart';
import 'package:fallora/backend/model/user/user.dart';
import 'package:retrofit/retrofit.dart';

import '../model/horoscope_request/relevance_request.dart';
import '../model/register/request/register_request.dart';

part 'functions.service.g.dart';


@RestApi(baseUrl: AppContants.BASE_URL)
abstract class FunctionsService  {
    factory FunctionsService(Dio dio, {String baseUrl}) = _FunctionsService;

    @GET("/getHoroscope")
    Future<HoroscopeReading> getHoroscopeReading(
      @Query("gender") String gender,
      @Query("sign") String sign
    );

    @GET("/suffleTarrots")
    Future<List<Tarot>> suffleTarrots();

    @GET("/getCoffeeFortune")
    Future<Fortune> getCoffeeFortune();

    @POST("/horoscopeRelevance")
    Future<HoroscopeRelevance> horoscopeRelevance(@Body() HoroscopeRelevanceRequest body);

    @POST("/login")
    Future<LoginResponse> login(@Body() LoginRequest body);

    @POST("/register")
    Future<String?> register(@Body() RegisterRequest body);

    @POST("/sendOtp")
    Future<String?> sendOtp(@Body() SendOtpRequest body);

    @POST("/verifyOtp")
    Future<String?> verifyOtp(@Body() VerifyOtpRequest body);

    @GET("/profile")
    Future<User> profile();

    @POST("/birthDateUpdate")
    Future<BirthDateResponse> updateBirthDate(@Body() BirthDateRequest body);
}