class UserModel {
  final int userId;
  final String userName, token;

  UserModel.fromJson(Map<String, dynamic> json)
      : userId = json['userId'],
        userName = json['userName'],
        token = json['Authoriazation'];
}
