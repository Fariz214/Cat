import 'package:ckm/features/authentication/screens/login/login_screen.dart';
import 'package:ckm/features/authentication/screens/onboarding/onboarding_screen.dart';
import 'package:ckm/features/authentication/screens/signup/email_verifiy_screen.dart';
import 'package:ckm/navigation_menu.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }
  
  screenRedirect() async {
    final user = _auth.currentUser;
    if (user != null){
      if (user.emailVerified) {
        Get.offAll(() => const NavigationMenu()); 
      } else{
        Get.offAll(() => VerifyEmailScreen(email: _auth.currentUser?.email));
      }
      
    } else{
      deviceStorage.writeIfNull('IsFirstTime', true);
      deviceStorage.read('IsFirstTime') != true 
        ? Get.offAll(() => const LoginScreen()) 
        : Get.offAll(const OnboardingScreen());
    }
  }
  /// Email Auth -- Register
  Future<UserCredential> registerWithEmailAndPassword(String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code, message: e.message);
    } on FirebaseException catch (e) {
      throw FirebaseException(code: e.code, message: e.message, plugin: '');
    } on FormatException catch (_) {
      throw const FormatException();
    } on PlatformException catch (e) {
      throw PlatformException(code: e.code, message: e.message);
    } catch (e) {
      throw 'Something went wrong, please try again ';
    } 
  } 

  /// Email Auth
  Future<void> sendEmailVerification() async {
    try {
      return await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code, message: e.message);
    } on FirebaseException catch (e) {
      throw FirebaseException(code: e.code, message: e.message, plugin: '');
    } on FormatException catch (_) {
      throw const FormatException();
    } on PlatformException catch (e) {
      throw PlatformException(code: e.code, message: e.message);
    } catch (e) {
      throw Exception('Something went wrong, please try again: $e');
    }
  }
  
  Future<UserCredential> loginWithEmailAndPassword(String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code, message: e.message);
    } on FirebaseException catch (e) {
      throw FirebaseException(code: e.code, message: e.message, plugin: '');
    } on FormatException catch (_) {
      throw const FormatException();
    } on PlatformException catch (e) {
      throw PlatformException(code: e.code, message: e.message);
    } catch (e) {
      throw 'Something went wrong, please try again ';
    } 
  }
  
  /// Email Auth Logout
  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => const LoginScreen());
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code, message: e.message);
    } on FirebaseException catch (e) {
      throw FirebaseException(code: e.code, message: e.message, plugin: '');
    } on FormatException catch (e) {
      throw FormatException(e.message);
    } on PlatformException catch (e) {
      throw PlatformException(code: e.code, message: e.message);
    } catch (e) {
      throw Exception('Something went wrong, please try again: $e');
    }
  }

  String getCurrentUserID() {
    final user = _auth.currentUser;
    if (user != null) {
      return user.uid;
    } else {
      throw Exception('No user logged in.');
    }
  }

  Future<void> addTransaction(String description, double formattedamount, String category) async {
    try {
      final userId = getCurrentUserID();
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(userId)
          .collection('Categories')
          .doc(category)
          .collection('Transactions')
          .add({
        'description': description,
        'amount': formattedamount,
        'timestamp': Timestamp.now(),
      });
    } catch (e) {
      'Error adding transaction';
    }
  }

  Stream<QuerySnapshot> getTransactions(String category) {
  try {
    final userId = getCurrentUserID();
    return FirebaseFirestore.instance
        .collection('Users')
        .doc(userId)
        .collection('Categories')
        .doc(category)
        .collection('Transactions')
        .orderBy('timestamp',descending: true)
        .snapshots();
  } catch (e) {
    'Error getting Transactions';
    throw Exception('Error getting Transactions');
  }
}

Stream<QuerySnapshot> getAllTransactions() {
  try {
    final userId = getCurrentUserID();
    return FirebaseFirestore.instance
        .collection('Users')
        .doc(userId)
        .collection('Categories')
        .orderBy('timestamp', descending: true)
        .snapshots();
  } catch (e) {
    throw Exception('Error getting Transactions: $e');
  }
}


  Future<void> deleteTransaction(String category, String transactionId) async {
    try {
      final userId = getCurrentUserID();
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(userId)
          .collection('Categories')
          .doc(category)
          .collection('Transactions')
          .doc(transactionId)
          .delete();
    } catch (e) {
      'Error deleting transaction';
    }
  }
  Future<void> addGoal(String goalName, double targetAmount, DateTime deadline) async {
  try {
    final userId = getCurrentUserID();
    await FirebaseFirestore.instance
        .collection('Users')
        .doc(userId)
        .collection('Goals')
        .add({
      'goalName': goalName,
      'targetAmount': targetAmount,
      'currentAmount': 0,
      'deadline': deadline,
    });
  } catch (e) {
    throw Exception('Error adding goal: $e');
  }
}

Stream<QuerySnapshot> getUserGoals() {
  try {
    final userId = getCurrentUserID();
    return FirebaseFirestore.instance
        .collection('Users')
        .doc(userId)
        .collection('Goals')
        .snapshots();
  } catch (e) {
    throw Exception('Error getting user goals: $e');
  }
}

Future<void> addMoneyToGoalByName(String goalName, double amountToAdd) async {
  try {
    final userId = getCurrentUserID();
    final QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('Users')
        .doc(userId)
        .collection('Goals')
        .where('goalName', isEqualTo: goalName)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      final goalId = querySnapshot.docs.first.id;
      final DocumentSnapshot goalSnapshot = querySnapshot.docs.first;
      final goalData = goalSnapshot.data() as Map<String, dynamic>;
      final currentAmount = (goalData['currentAmount'] ?? 0).toDouble();


      await FirebaseFirestore.instance
          .collection('Users')
          .doc(userId)
          .collection('Goals')
          .doc(goalId)
          .update({'currentAmount': currentAmount + amountToAdd});
    }
  } catch (e) {
    throw Exception('Error adding money to goal: $e');
  }
}


Future<void> deleteGoal(String goalId) async {
  try {
    final userId = getCurrentUserID();
    await FirebaseFirestore.instance
        .collection('Users')
        .doc(userId)
        .collection('Goals')
        .doc(goalId)
        .delete();
  } catch (e) {
    throw Exception('Error deleting goal: $e');
  }
}

}