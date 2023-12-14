import 'package:ckm/data/Repository/authentication/authentication_repository.dart';
import 'package:ckm/features/authentication/screens/signup/succes_screen.dart';
import 'package:ckm/utils/constants/image_strings.dart';
import 'package:ckm/utils/constants/text_strings.dart';
import 'package:ckm/utils/loaders/loaders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'dart:async';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  @override
  void onInit(){
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  sendEmailVerification() async{
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      Loaders.succesSnackBar(title: 'Email Sent', message: 'Please Check your inbox and verify email');
    } catch (e) {
      Loaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

  setTimerForAutoRedirect() {
  Timer.periodic(const Duration(seconds: 1), 
    (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
        final user = FirebaseAuth.instance.currentUser;
        if (user?.emailVerified ?? false) {
          timer.cancel();
          Get.off(
            () => SuccesScreen(
              image: CKMImages.animation2,
              title: CKMTexts.yourAccountCreatedTitle,
              subTitle: CKMTexts.yourAccountCreatedSubTitle,
              onPressed: () => AuthenticationRepository.instance.screenRedirect(),
        ),
      );
    }
  });
}

  checkEmailVerificationStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      Get.off(
            () => SuccesScreen(
              image: CKMImages.animation2,
              title: CKMTexts.yourAccountCreatedTitle,
              subTitle: CKMTexts.yourAccountCreatedSubTitle,
              onPressed: () => AuthenticationRepository.instance.screenRedirect(),
        )
    );
    }
    
  }
  
}