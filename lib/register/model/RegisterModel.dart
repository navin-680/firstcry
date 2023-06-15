class RegisterModel {
  String? fullName;
  int? mobileNo;
  String? email;
  String? password;

  RegisterModel({this.fullName, this.mobileNo, this.email, this.password});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    fullName = json['fullName'];
    mobileNo = json['mobile_no'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['fullName'] = fullName;
    data['mobile_no'] = mobileNo;
    data['email'] = email;
    data['password'] = password;
    return data;
  }
}
