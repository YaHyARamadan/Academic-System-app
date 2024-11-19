import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../../core/helper/enums/share_prefs_key.dart';
import '../../../../core/helper/shared_prefs/cache_helper.dart';
import '../../../../core/routes/routes.dart';

class LoginProvider extends ChangeNotifier {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passWordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> login({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      CacheHelper.putBool(key: SharedKey.isLoggedIn, value: true);
      CacheHelper.putString(key: SharedKey.email, value: email);

      await Future.delayed(const Duration(seconds: 3), () {
        Navigator.of(context).pushNamedAndRemoveUntil(
          AppRoutes.outroScreen,
          (route) => false,
        );
      });
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> resetPassword(
      TextEditingController emailController, BuildContext context) async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text);
      emailController.clear();
      Navigator.pop(context);
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Error resetting password. Please try again.')),
      );
    }
  }

  Future<void> logout({
    required BuildContext context,
  }) async {
    try {
      await FirebaseAuth.instance.signOut();

      CacheHelper.putBool(key: SharedKey.isLoggedIn, value: false);
      CacheHelper.delete(
        key: SharedKey.email,
      );

      await Future.delayed(const Duration(seconds: 3), () {
        Navigator.of(context).pushNamedAndRemoveUntil(
          AppRoutes.introScreen,
          (route) => false,
        );
      });
    } catch (e) {
      print(e.toString());
    }
  }

  Future<bool> checkLoginStatus() async {
    bool isLoggedIn = CacheHelper.getBool(key: SharedKey.isLoggedIn) ?? false;
    return isLoggedIn;
  }
}
