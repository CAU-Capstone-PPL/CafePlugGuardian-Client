import 'package:cafe_plug_guardian_client/style.dart';
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
      body: Column(
        children: [
          const Padding(padding: EdgeInsets.only(top: 50)),
          Form(
            child: Container(
              padding: const EdgeInsets.all(40.0),
              // 키보드가 올라와서 만약 스크린 영역을 차지하는 경우 스크롤이 되도록
              // SingleChildScrollView으로 감싸 줌
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const TextField(
                      decoration: InputDecoration(labelText: 'Enter Id'),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const TextField(
                      decoration: InputDecoration(labelText: 'Enter Password'),
                      keyboardType: TextInputType.text,
                      obscureText: true, // 비밀번호 안보이도록 하는 것
                    ),
                    const SizedBox(
                      height: 40.0,
                    ),
                    ButtonTheme(
                      minWidth: 100.0,
                      height: 50.0,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColor.main),
                        child: const Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                          size: 35.0,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
