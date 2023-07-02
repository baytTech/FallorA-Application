import 'dart:async';
import 'package:fallora/backend/auth/user.cubit.dart';
import 'package:fallora/backend/config/app.constants.dart';
import 'package:fallora/backend/model/user/user.dart';
import 'package:fallora/backend/repo/functions_repo.dart';
import 'package:fallora/backend/repo/local_repo.dart';
import 'package:fallora/backend/util/base_response.dart';

class AuthManager {
  final LocalRepo localRepo;
  final FunctionsRepo functionsRepo;
  final StreamController<String?> tokenStreamController = StreamController();
  final UserCubic userCubic = UserCubic();
  Stream<String?> get tokenStream => tokenStreamController.stream;


  AuthManager({required this.localRepo,required this.functionsRepo}) {
    init();
  }

  void init() {
    addToken(localRepo.idToken);
  }

  Future<User?> getUser() async {
    var response = await functionsRepo.profile();
    if(response.status == Status.SUCCESS) {
      userCubic.updateState(response.data);
      tokenStreamController.add(AppContants.AUTH_TOKEN);
      return response.data;
    }
    else {
      localRepo.idToken = null;
      tokenStreamController.add(null);
    }
    return null;
  }

  void addToken(String? token) {
    if(token == null) {
      Future.delayed(
        const Duration(seconds: 2),
        () => tokenStreamController.add(null)
      );
    }
    else {
      AppContants.AUTH_TOKEN = token;
      getUser();
    }
  }

  void addValidToken(String? token) {
    AppContants.AUTH_TOKEN = token;
    localRepo.idToken = token;
    tokenStreamController.add(token);
    getUser();
  }

   
  void dispose() {
    tokenStreamController.close();
  }
  
  void updateUser() async {
    var response = await functionsRepo.profile();
    if(response.status == Status.SUCCESS) {
      userCubic.updateState(response.data);
    }
  }
}