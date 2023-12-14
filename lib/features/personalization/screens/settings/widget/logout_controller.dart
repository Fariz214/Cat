import 'package:ckm/data/Repository/authentication/authentication_repository.dart';
import 'package:ckm/features/authentication/screens/login/login_screen.dart';
import 'package:get/get.dart';

class LogoutController extends GetxController {
  static LogoutController get instance => Get.put(LogoutController());

  Future<void> logout() async {
    try {
      await AuthenticationRepository.instance.logout();
      Get.to(() => const LoginScreen());
    } catch (e) {
      throw 'Logout error';
    }
  }

}