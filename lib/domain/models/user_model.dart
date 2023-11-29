import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  UserModel({
    this.uid,
    this.displayName,
    this.email,
    this.password,
    this.isAnonymous,
  });

  String? uid;
  String? email;
  String? password;
  String? displayName;
  bool? isAnonymous;

  bool get isAuthorized => uid != null && uid != 'empty';

  factory UserModel.empty() => UserModel(uid: 'empty');

  factory UserModel.fromUserCredential(UserCredential uc) =>
      UserModel.fromFbModel(uc.user);

  factory UserModel.fromFbModel(User? user) {
    if (user == null) return UserModel.empty();
    return UserModel(
      uid: user.uid,
      displayName: user.displayName ?? 'Guest',
      email: user.email,
      isAnonymous: user.isAnonymous,
    );
  }

  UserModel copyWith({
    String? uid,
    String? email,
    String? password,
    String? displayName,
    bool? isAnonymous,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      password: password ?? this.password,
      displayName: displayName ?? this.displayName,
      isAnonymous: isAnonymous ?? this.isAnonymous,
    );
  }

  @override
  String toString() {
    return '''
    uid: $uid,
    displayName: $displayName,
    email: $email,
    ''';
  }
}
