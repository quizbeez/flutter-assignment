import 'package:flutter_home_assignment/model/login_master.dart';

abstract class BaseServices {
  Future<LoginMaster?> login(
      {required String email, required String password, onNoInternet});
}
