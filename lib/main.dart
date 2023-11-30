import 'package:cafe_plug_guardian_client/provider/menu_provider.dart';
import 'package:cafe_plug_guardian_client/provider/plug_core_provider.dart';
import 'package:cafe_plug_guardian_client/provider/plug_detail_provider.dart';
import 'package:cafe_plug_guardian_client/provider/user_provider.dart';
import 'package:cafe_plug_guardian_client/screens/login_screen.dart';
import 'package:cafe_plug_guardian_client/style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (BuildContext context) => UserProvider()),
        ChangeNotifierProvider(
            create: (BuildContext context) => PlugCoreProvider()),
        ChangeNotifierProvider(
            create: (BuildContext context) => PlugDetailProvider()),
        ChangeNotifierProvider(
            create: (BuildContext context) => MenuProvider()),
      ],
      child: MaterialApp(
        title: 'cafe_plug_guardian_client',
        theme: ThemeData(
          fontFamily: 'Gmarket',
          colorScheme: ColorScheme.fromSeed(seedColor: AppColor.main),
          useMaterial3: true,
        ),
        home: const LoginScreen(),
      ),
    );
  }
}
