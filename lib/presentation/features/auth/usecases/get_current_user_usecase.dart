import 'package:furniture_shop_app/domain/models/models.dart';
import 'package:furniture_shop_app/domain/repositories/repositories.dart';
import 'package:talker/talker.dart';

class GetCurrentUserUsecase {
  const GetCurrentUserUsecase({required this.authRepository});

  final AbstractAuthRepository authRepository;

  Future<UserModel> call() async {
    try {
      final currentUser = await authRepository.getUserStream().first;
      Talker().debug(currentUser);
      return currentUser;
    } catch (e) {
      Talker().error(e);
      throw Exception(e); // TODO
    }
  }
}
