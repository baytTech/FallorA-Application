import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:fallora/backend/auth/auth.manager.dart';
import 'package:fallora/backend/config/app.constants.dart';
import 'package:fallora/backend/repo/functions_repo.dart';
import 'package:fallora/backend/repo/local_repo.dart';
import 'package:fallora/backend/service/functions.service.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';


GetIt getIt = GetIt.instance;
Logger logger = Logger();
Future<void> setupModules() async {
  GetIt.I.registerSingleton<LocalRepo>(await LocalRepo.init());
  GetIt.I.registerFactory<Dio>((){
      Dio dio = Dio();
      dio.interceptors.add(LogInterceptor());
      dio.interceptors.add(InterceptorsWrapper(
        onRequest: (options, handler) {
          if(AppContants.AUTH_TOKEN != null) {
            options.headers.putIfAbsent('Authorization', () => 'Bearer ${AppContants.AUTH_TOKEN}');
            log("Bearer ${AppContants.AUTH_TOKEN}");
          }
          handler.next(options);
        },
      ));
      return dio;
    }
  );

  GetIt.I.registerSingleton<FunctionsService>(FunctionsService(GetIt.I.get(),baseUrl: AppContants.BASE_URL));
  GetIt.I.registerSingleton<FunctionsRepo>(FunctionsRepoImpl(GetIt.I.get()));
  GetIt.I.registerSingleton<AuthManager>(AuthManager(localRepo: GetIt.I.get(),functionsRepo: getIt.get()));
}