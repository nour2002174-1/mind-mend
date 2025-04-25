

import 'package:first_try/core/utils/api_server.dart';

class AuthRepository_login {
  final ApiService apiService_login;

  AuthRepository_login(this.apiService_login);

  Future<Map<String, dynamic>> login(String email, String password) async {
    final response = await apiService_login.post(
      url: 'api/Account/firebase/login',
      body: {'email': email, 'password': password},
    );
    return response;
  }
}
