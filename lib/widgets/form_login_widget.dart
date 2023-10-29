import 'package:cafe_plug_guardian_client/screens/home_screen.dart';
import 'package:cafe_plug_guardian_client/services/api_service.dart';
import 'package:cafe_plug_guardian_client/style.dart';
import 'package:flutter/material.dart';

class FormLogin extends StatefulWidget {
  const FormLogin({super.key});

  @override
  State<FormLogin> createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
  final _formKey = GlobalKey<FormState>();
  late String userId;
  late String password;
  late Future<String> token;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter Id',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter id.';
                  }
                  return null;
                },
                onSaved: (value) => userId = value!,
                keyboardType: TextInputType.text,
              ),
              const SizedBox(
                height: 40.0,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter Password',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter password.';
                  }
                  return null;
                },
                onSaved: (value) => password = value!,
                keyboardType: TextInputType.text,
                obscureText: true,
              ),
              const SizedBox(
                height: 40.0,
              ),
              GestureDetector(
                child: Container(
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: AppColor.main,
                  ),
                  child: const Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                    size: 35.0,
                  ),
                ),
                onTap: () {
                  //토큰 api를 부르고 확인되면 넘어가기
                  //token = ApiService.login(userId, password);

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeScreen(/** token */),
                      fullscreenDialog: true,
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
