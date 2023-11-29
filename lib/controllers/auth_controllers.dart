import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:packingticketingsystem/screens/home_screen.dart';
import 'package:packingticketingsystem/screens/login%20page.dart';
import 'package:packingticketingsystem/utils/constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter/animation.dart';

class AuthController extends GetxController {
  final _authController = Supabase.instance;
  User? get user => _authController.client.auth.currentUser;
  final storage = GetStorage();
  String? roles;
  late bool isAdmin;
  late String fullName = "";
  late String email = "";
  late String avatarUrl = "";
  late String dob = "";
  late String gender = "";

  Future signIn(String phoneNumber, String password) async {
    try {
      final response = await _authController.client.auth
          .signInWithPassword(phone: phoneNumber, password: password);
      final User? user = response.user;
      // dynamic meta = user?.userMetadata;

      final res =
          await supabase.from('profiles').select().eq('id', user?.id).single();

      isAdmin = res['is_admin'] ?? false;
      fullName = res['full_name'] ?? "";
      email = res['email'] ?? "";
      avatarUrl = res['avatar_url'] ?? "";
      dob = res['dob'] ?? "";
      gender = res['gender'] ?? "";

      if (fullName != "") {
        storage.write('profile', {
          "fullName": fullName,
          "avatarUrl": avatarUrl,
          "email": email,
          "admin": isAdmin,
          "dob": dob,
          "gender": gender
        });
        if (isAdmin == true) {
          Get.to(
            () => const HomeScreen(),
            transition: Transition.cupertino,
            duration: const Duration(milliseconds: 600),
            curve: Curves.easeOut,
          );
        } else {
          Get.to(
            () => const HomeScreen(),
            transition: Transition.cupertino,
            duration: const Duration(milliseconds: 600),
            curve: Curves.easeOut,
          );
        }
      } else {
        Get.to(
          () => const HomeScreen(),
          transition: Transition.cupertino,
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeOut,
        );
      }
    } on AuthException catch (error) {
      String errorMessage = error.message;
      kDefaultDialog(
        "Error",
        errorMessage,
      );
    } on PostgrestException catch (error) {
      String errorMessage = error.message;
      kDefaultDialog(
        "Error",
        errorMessage,
      );
    }
  }

  Future forgotPassword(String email) async {
    await _authController.client.auth.resetPasswordForEmail(email);
    Get.snackbar(
      "Password reset",
      "Password reset request has been sent to your email successfully.",
    );
  }

  Future signUp(
    String email,
    String phoneNumber,
    String password,
    String name
  ) async {
    try {
      final response =
          await supabase.auth.signUp(phone: phoneNumber, password: password, data: {
            'email': email,
            'phone': phoneNumber,
            'full_name': name 
          });

      // final Session? session = response.session;
      final User? user = response.user;

      if (user != null) {
        kDefaultDialog("Successful Signed Up", "Proceed to Profile",
            onYesPressed: () {
          Get.to(
            () => const HomeScreen(),
            transition: Transition.cupertino,
            duration: const Duration(milliseconds: 600),
            curve: Curves.easeOut,
          );
        });
      }
    } on AuthException catch (error) {
      String errorMessage = error.message;
      kDefaultDialog(
        "Error",
        errorMessage,
      );
    } on PostgrestException catch (error) {
      String errorMessage = error.message;
      kDefaultDialog(
        "Error",
        errorMessage,
      );
    }
  }

  void signOut() {
    kDefaultDialog(
      "Sign out",
      "Are you sure you want to sign out?",
      onYesPressed: () {
        Get.offAll(const LoginPage());
        storage.remove('profile');
        _authController.client.auth.signOut();
      },
    );
  }
}