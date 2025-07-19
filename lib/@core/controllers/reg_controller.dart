import 'package:dibasys_project/@core/configs/shared_pref.dart';
import 'package:dibasys_project/@core/router/routenames.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';

class RegController with ChangeNotifier {
  RegController({required this.context});
  final BuildContext context;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneNoController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void registerUser() async {
    final box = Hive.box('userBox');
    final phone = phoneNoController.text;

    final userData = {
      "name": nameController.text,
      "mobile": phone.isEmpty ? null : phone,
      "password": passwordController.text,
    };

    await box.put(phone, userData);
    await box.put('loggedInUserPhone', phone);

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('User registered successfully')));
    await SharedPrefsUtil.putString(SharedPrefsUtil.loggedin, "loggedin");
    nameController.clear();
    phoneNoController.clear();
    passwordController.clear();

    context.pushReplacement(RouteNames.dashboard);
  }
}
