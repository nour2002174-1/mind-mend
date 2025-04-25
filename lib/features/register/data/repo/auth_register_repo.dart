
import 'package:first_try/core/utils/api_server.dart';
import 'package:first_try/features/register/data/model/auth_register_model.dart';

class AuthRepository {
  final ApiService _apiService = ApiService();

  Future<RegisterModel> register({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String gender,
    required String birthday,
    required String status,
    required String address,
    required String mobile,
    required String specialist,
    required String type,
  }) async {
    final response = await _apiService.post(url: "register", body: {
      "email": email,
      "password": password,
      "first_name": firstName,
      "last_name": lastName,
      "gender": gender,
      "birthday": birthday,
      "status": status,
      "address": address,
      "mobile": mobile,
      "specialist": specialist,
      "type": type,
    });

    print(response);
    return RegisterModel.fromJson(response);
  }}