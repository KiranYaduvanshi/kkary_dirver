class LoginPost {
  String? email;
  String? password;
  String? userType;
  String? deviceToken;

  LoginPost({this.email, this.password, this.userType, this.deviceToken});

  LoginPost.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    userType = json['user_type'];
    deviceToken = json['device_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['password'] = this.password;
    data['user_type'] = this.userType;
    data['device_token'] = this.deviceToken;
    return data;
  }
}
