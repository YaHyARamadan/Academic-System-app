import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../../../core/helper/enums/share_prefs_key.dart';
import '../../../../core/helper/shared_prefs/cache_helper.dart';
import '../../../../core/routes/routes.dart';

class RegisterProvider extends ChangeNotifier {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passWordController = TextEditingController();

  Future<void> register({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      CacheHelper.putBool(key: SharedKey.isLoggedIn, value: true);
      CacheHelper.putString(key: SharedKey.email, value: email);

      await Future.delayed(const Duration(seconds: 3), () {
        Navigator.of(context).pushNamedAndRemoveUntil(
          AppRoutes.outroScreen,
          (route) => false,
        );
      });
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) {
        return;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);

      CacheHelper.putBool(key: SharedKey.isLoggedIn, value: true);
      CacheHelper.putString(key: SharedKey.email, value: googleUser.email);

      Navigator.of(context).pushNamedAndRemoveUntil(
        AppRoutes.outroScreen,
        (route) => false,
      );
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error signing in. Please try again.')),
      );
    }
  }

  Future<void> signInWithFacebook(BuildContext context) async {
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();

      if (loginResult.status == LoginStatus.success) {
        final OAuthCredential facebookAuthCredential =
            FacebookAuthProvider.credential(
                loginResult.accessToken!.tokenString);

        await FirebaseAuth.instance
            .signInWithCredential(facebookAuthCredential);

        CacheHelper.putBool(key: SharedKey.isLoggedIn, value: true);
        CacheHelper.putString(
            key: SharedKey.email,
            value: FirebaseAuth.instance.currentUser?.email ?? '');

        Navigator.of(context).pushReplacementNamed(AppRoutes.outroScreen);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Facebook sign-in failed.')),
        );
      }
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error signing in with Facebook.')),
      );
    }
  }
}
