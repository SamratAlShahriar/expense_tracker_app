const String T_USER_TABLE = 'tbl_user';
const String T_U_COL_ID = 'user_id';
const String T_U_COL_EMAIL = 'email';
const String T_U_COL_PASSWORD = 'password';

class UserModel {
  int? userId;
  String email;
  String password;

  UserModel({
    this.userId,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{
      T_U_COL_EMAIL: email,
      T_U_COL_PASSWORD: password,
    };
    if (userId != null) {
      map[T_U_COL_ID] = userId;
    }
    return map;
  }

  factory UserModel.fromMap(Map<String, dynamic> map) => UserModel(
        userId: map[T_U_COL_ID],
        email: map[T_U_COL_EMAIL],
        password: map[T_U_COL_PASSWORD],
      );
}
