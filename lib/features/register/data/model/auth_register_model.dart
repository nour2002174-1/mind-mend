class RegisterModel {
  final String email;
  final String password;
  final String firstName;
  final String lastName;
  final String gender;
  final String birthday;
  //final String status;
  //final String address;
  final String mobile;
  //final String specialist;
  //final String type;

  RegisterModel({
    required this.email,
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.birthday,
   // required this.status,
   // required this.address,
    required this.mobile,
    //required this.specialist,
    //required this.type,
  });

  Map<String, dynamic> toJson() {
    return {
      "email": email.trim(),
      "password": password.trim(),
      "first_name": firstName.trim(),
      "last_name": lastName.trim(),
      "gender": gender,
      "birthday": birthday,
      //"status": status,
      //"address": address.trim(),
      "mobile": mobile.trim(),
     // "specialist": specialist,
      //"type": type,
    };
  }

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
      email: json["email"]?.toString() ?? "",
      password: json["password"]?.toString() ?? "",
      firstName: json["first_name"]?.toString() ?? "",
      lastName: json["last_name"]?.toString() ?? "",
      gender: json["gender"]?.toString() ?? "",
      birthday: json["birthday"]?.toString() ?? "",
      //status: json["status"]?.toString() ?? "",
      //address: json["address"]?.toString() ?? "",
      mobile: json["mobile"]?.toString() ?? "",
     // specialist: json["specialist"]?.toString() ?? "",
     // type: json["type"]?.toString() ?? "",
    );
  }
}