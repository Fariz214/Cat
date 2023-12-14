import 'package:ckm/data/Repository/authentication/authentication_repository.dart';
import 'package:ckm/utils/constants/image_strings.dart';
import 'package:ckm/utils/loaders/full_screen_loader.dart';
import 'package:ckm/utils/loaders/loaders.dart';
import 'package:ckm/utils/popups/network.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();
  final localStorage = GetStorage();
  final hidepassword = true.obs;
  final checkbox = true.obs; 
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    String? storedEmail = localStorage.read('REMEMBER_ME_EMAIL');

    if (storedEmail != null) {
      email.text = storedEmail;
    }
    super.onInit();
  }

  Future<void> login() async {
    try {
       // Start Loading
      FullScreenLoading.openLoadingDialog('Logging in', CKMImages.animation1);
      
      // Connection Check
      final isConnected = await Network.instace.isConnected();
      if (!isConnected) {
        FullScreenLoading.stopLoading();
        return;
      }

      // Form Validate
      if (!loginFormKey.currentState!.validate()) {
        FullScreenLoading.stopLoading();
        return;}
      
      // Check Box
      if (!checkbox.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }
    await AuthenticationRepository.instance.loginWithEmailAndPassword(email.text.trim(), password.text.trim());

    // Menyimpan hasil login dalam variabel isLoggedIn
    FullScreenLoading.stopLoading();
    
    // Succes Message
    Loaders.succesSnackBar(title: 'Congratulations', message: 'Login Complete');

    AuthenticationRepository.instance.screenRedirect();
    } 
    catch (e) {
    FullScreenLoading.stopLoading();
    Loaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
