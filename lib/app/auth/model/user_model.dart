class UserModel {
  String? email, id, mobile, userName;

  UserModel({
    required this.email,
    required this.id,
    required this.mobile,
    required this.userName,
  });

  UserModel.fromJson(json) {
    email = json['email'];
    id = json['id'];
    mobile = json['mobile'];
    userName = json['user_name'];
  }

  userModelToJson() {
    final Map<String, dynamic> data = {};
    data['email'] = email;
    data['id'] = id;
    data['mobile'] = mobile;
    data['user_name'] = userName;

    return data;
  }
}
