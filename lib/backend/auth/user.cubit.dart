import 'package:fallora/backend/model/user/user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserCubic extends Cubit<User?> {
  UserCubic(): super(null);


  void updateState(User? _user) {
    emit(_user);
  }
}