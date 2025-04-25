class LoginModel {
  final String? message;
  final String? token;
  final String? uid;
  final String? email;

  LoginModel({this.message, this.token, this.uid, this.email});

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      message: json['message'],
      token: json['token'],
      uid: json['uid'],
      email: json['email'],
    );
  }
}
