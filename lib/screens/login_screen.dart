import 'package:cafe_plug_guardian_client/style.dart';
import 'package:cafe_plug_guardian_client/widgets/form_login_widget.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log in'),
        elevation: 0.0,
        backgroundColor: AppColor.main,
        centerTitle: true,
      ),
      body: const Column(
        children: [
          Padding(padding: EdgeInsets.only(top: 50)),
          FormLogin(),
        ],
      ),
    );
  }
}
