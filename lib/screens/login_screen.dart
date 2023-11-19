import 'package:cafe_plug_guardian_client/screens/home_screen.dart';
import 'package:cafe_plug_guardian_client/style.dart';
import 'package:cafe_plug_guardian_client/widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _userIdController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: AppBar(
        title: const HeadingText(content: 'Login'),
        backgroundColor: AppColor.background,
      ),
      body: Container(
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
              controller: _userIdController,
              decoration: const InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.all(12.0),
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
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
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
