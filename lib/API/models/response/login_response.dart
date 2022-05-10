class LoginResponse {
  Data? data;
  String? message;
  int? statusCode;

  LoginResponse({this.data, this.message, this.statusCode});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
    statusCode = json['status_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    data['status_code'] = this.statusCode;
    return data;
  }
}

class Data {
  String? firstName;
  String? lastName;
  String? email;
  String? mobileNo;
  int? userType;
  String? businessName;
  String? bio;
  String? address;
  String? image;
  String? token;

  Data(
      {this.firstName,
        this.lastName,
        this.email,
        this.mobileNo,
        this.userType,
        this.businessName,
        this.bio,
        this.address,
        this.image,
        this.token});

  Data.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    mobileNo = json['mobile_no'];
    userType = json['user_type'];
    businessName = json['business_name'];
    bio = json['bio'];
    address = json['address'];
    image = json['image'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['mobile_no'] = this.mobileNo;
    data['user_type'] = this.userType;
    data['business_name'] = this.businessName;
    data['bio'] = this.bio;
    data['address'] = this.address;
    data['image'] = this.image;
    data['token'] = this.token;
    return data;
  }
}