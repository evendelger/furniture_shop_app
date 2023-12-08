class UserLogInModel {
  const UserLogInModel({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;
}

class UserRegisterModel extends UserLogInModel {
  const UserRegisterModel({
    required this.displayName,
    required super.email,
    required super.password,
  });

  final String displayName;
}
