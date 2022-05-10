class ForgotRequest {
  String? email;
  String? userType;

  ForgotRequest({this.email, this.userType});

  ForgotRequest.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    userType = json['user_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['user_type'] = this.userType;
    return data;
  }
}