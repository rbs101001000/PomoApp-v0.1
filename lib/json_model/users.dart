// To parse this JSON data, do
//
//     final users = usersFromJson(jsonString);

class Users {
  final int? userId;
  final String userName;
  final String userPassword;

  Users({
    this.userId,
    required this.userName,
    required this.userPassword,
  });

  factory Users.fromJson(Map<String, dynamic> json) => Users(
    userId: json["user_id"],
    userName: json["userName"],
    userPassword: json["userPassword"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "userName": userName,
    "userPassword": userPassword,
  };
}
