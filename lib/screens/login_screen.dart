import 'package:cafe_plug_guardian_client/models/user_model.dart';
import 'package:cafe_plug_guardian_client/screens/cafe_manage_screen.dart';
import 'package:cafe_plug_guardian_client/screens/signup_screen.dart';
import 'package:cafe_plug_guardian_client/services/api_login.dart';
import 'package:cafe_plug_guardian_client/style.dart';
import 'package:cafe_plug_guardian_client/widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:cafe_plug_guardian_client/provider/user_provider.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _userAccountController = TextEditingController();
  final TextEditingController _userPwController = TextEditingController();

  void _showErrorSnackBar(BuildContext context, String errorMessage) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const HeadingText(content: 'Error'),
        content: BoldText(content: errorMessage),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: AppBar(
        title: const HeadingText(content: 'Login'),
        backgroundColor: AppColor.background,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(
                image: AssetImage('assets/smartPlug.png'),
                width: 200,
              ),
              const SizedBox(
                height: 10,
              ),
              const HeadingText(content: 'Cafe Plug Guardian'),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: _userAccountController,
                decoration: const InputDecoration(
                  labelText: 'User Account',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(12.0),
                ),
              ),
              const SizedBox(height: 16.0),
              TextField(
                controller: _userPwController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(12.0),
                ),
              ),
              const SizedBox(height: 16.0),
              CustomButton(
                content: 'Login',
                onPressed: () async {
                  try {
                    String userAccount = _userAccountController.text;
                    String userPw = _userPwController.text;
                    UserModel user =
                        await ApiLogin.postLogin(userAccount, userPw);
                    context.read<UserProvider>().login(user);
                    _userAccountController.clear();
                    _userPwController.clear();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CafeManageScreen()));
                  } catch (e) {
                    final errorMessage = e.toString();
                    _showErrorSnackBar(context, errorMessage);
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const CaptionText(content: '아직 회원이 아니신가요?'),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUpScreen()));
                      },
                      child: const CaptionText(content: '회원가입 하러 가기')),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
