class SignUpModel{
  String username;
  String email;
  String phone;
  String password;
  
  SignUpModel({
    required this.username,
    required this.email,
    required this.phone,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'email'   : email,
      'phone'   : phone,
      'password': password,
    };
  }
}