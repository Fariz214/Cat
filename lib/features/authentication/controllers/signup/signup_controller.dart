import 'package:ckm/data/Repository/authentication/authentication_repository.dart';
import 'package:ckm/data/Repository/user/user_model.dart';
import 'package:ckm/data/Repository/user/user_repo.dart';
import 'package:ckm/features/authentication/screens/signup/email_verifiy_screen.dart';
import 'package:ckm/utils/constants/image_strings.dart';
import 'package:ckm/utils/loaders/full_screen_loader.dart';
import 'package:ckm/utils/loaders/loaders.dart';
import 'package:ckm/utils/popups/network.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  ///Variabel
  final hidepassword = true.obs;
  final checkbox = true.obs; 
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final username = TextEditingController();
  final email = TextEditingController();
  final phoneNumber = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  /// Sign Up
  Future<void> signup() async {
    try {
      // Start Loading
      FullScreenLoading.openLoadingDialog('We are Processing Information', CKMImages.animation1);
      
      // Connection Check
      final isConnected = await Network.instace.isConnected();
      if (!isConnected) {
        FullScreenLoading.stopLoading();
        return;
      }

      // Form Validate
      if (!signupFormKey.currentState!.validate()) {
        FullScreenLoading.stopLoading();
        return;
      }
      

      // Check Box
      if (!checkbox.value) {
        Loaders.warningSnackBar(
          title: 'Accept Privacy Policy',
          message: 'In Order to Create Account, You Must Have to Read and Accept The Privacy Policy & Term of Use',
        ); 
        FullScreenLoading.stopLoading();
        return;
      }

      // Register Firebase
      final userCredential = await AuthenticationRepository.instance.registerWithEmailAndPassword(email.text.trim(), password.text.trim());

      // Save Authentification User To Firebase
      final newUser = UserModel(
        id: userCredential.user!.uid, 
        firstName: firstName.text.trim(), 
        lastName: lastName.text.trim(), 
        username: username.text.trim(), 
        email: email.text.trim(), 
        phoneNumber: phoneNumber.text.trim(), 
        profilePicture: '',
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      
      FullScreenLoading.stopLoading();

      // Move to
      Get.to(() => VerifyEmailScreen(email: email.text.trim()));

    } catch (e) {
      FullScreenLoading.stopLoading();
      Loaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } 
  }
}
