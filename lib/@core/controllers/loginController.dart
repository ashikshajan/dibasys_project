import 'package:dibasys_project/@core/configs/shared_pref.dart';
import 'package:dibasys_project/@core/router/routenames.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LoginController with ChangeNotifier {
  LoginController({required this.context}) {
    passcodeFocusNodes = List.generate(4, (_) => FocusNode());
  }

  final BuildContext context;

  bool _rememberMe = false;
  bool get rememberMe => _rememberMe;

  set rememberMe(bool val) {
    _rememberMe = val;
    notifyListeners();
  }

  final TextEditingController phoneController = TextEditingController();
  final List<TextEditingController> passcodeControllers = List.generate(
    4,
    (_) => TextEditingController(),
  );

  late List<FocusNode> passcodeFocusNodes;

  void handleLogin() async {
    final box = Hive.box('userBox');
    final phone = phoneController.text.trim();
    final passcode = passcodeControllers.map((c) => c.text).join();

    if (phone.isEmpty || passcode.length < 4) {
      showSnack("Enter valid Phone and 4-digit passcode");
      return;
    }

    final user = box.get(phone);

    if (user == null) {
      showSnack("User not found. Please register first.");
    } else if (user['password'] != passcode) {
      showSnack("Incorrect passcode.");
    } else {
      await box.put('loggedInUserPhone', phone);
      phoneController.clear();
      for (var controller in passcodeControllers) {
        controller.clear();
      }
      await SharedPrefsUtil.putString(SharedPrefsUtil.loggedin, "loggedin");
      context.pushReplacement(RouteNames.dashboard);

      phoneController.clear();
      for (final controller in passcodeControllers) {
        controller.clear();
      }
    }
  }

  void showSnack(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  void disposeFields() {
    phoneController.dispose();
    for (final controller in passcodeControllers) {
      controller.dispose();
    }
    for (final node in passcodeFocusNodes) {
      node.dispose();
    }
  }
}
