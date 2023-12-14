abstract interface class UserAuthModel {}

class UserLogInModel implements UserAuthModel {
  const UserLogInModel({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;
}

class UserRegisterModel implements UserAuthModel {
  const UserRegisterModel({
    required this.displayName,
    required this.email,
    required this.password,
  });

  final String email;
  final String password;
  final String displayName;
}
