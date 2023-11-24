import 'dart:async';
import 'package:cafe_plug_guardian_client/provider/plug_core_provider.dart';
import 'package:cafe_plug_guardian_client/provider/user_provider.dart';
import 'package:cafe_plug_guardian_client/screens/alert_screen.dart';
import 'package:cafe_plug_guardian_client/screens/login_screen.dart';
import 'package:cafe_plug_guardian_client/screens/plug_detail_screens.dart';
import 'package:cafe_plug_guardian_client/screens/plug_list_screen.dart';
import 'package:cafe_plug_guardian_client/style.dart';
import 'package:cafe_plug_guardian_client/widgets/custom_button_widget.dart';
import 'package:cafe_plug_guardian_client/widgets/plug_widget.dart';
import 'package:cafe_plug_guardian_client/widgets/power_entry_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    context.read<PlugCoreProvider>().updateOnPlugs();
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      context.read<PlugCoreProvider>().updateOnPlugs();
    });
  }

  void _stopTimer() {
    _timer.cancel();
  }

  @override
  void dispose() {
    _stopTimer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: AppColor.background,
        foregroundColor: AppColor.text,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const AlertScreen()));
            },
            icon: const Icon(
              Icons.add_alert_outlined,
              size: 40,
            ),
          ),
          IconButton(
            onPressed: () {
              context.read<UserProvider>().logout();
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const LoginScreen()));
            },
            icon: const Icon(
              Icons.logout,
              size: 40,
            ),
          ),
        ],
        title: AppBarText(
          content: context.read<UserProvider>().user!.userName,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const HeadingText(
                  content: 'ON Plug List',
                ),
                CustomButton(
                    content: 'View all',
                    onPressed: () {
                      _stopTimer();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PlugListScreen(),
                        ),
                      ).then((_) {
                        _startTimer();
                      });
                    }),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: GridView.count(
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                crossAxisCount: 2,
                childAspectRatio: 1.2,
                children: context
                    .watch<PlugCoreProvider>()
                    .onPlugs
                    .map(
                      (plug) => GestureDetector(
                        onTap: () {
                          _stopTimer();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  PlugDetailScreen(id: plug.plugId),
                            ),
                          ).then((_) {
                            _startTimer();
                          });
                        },
                        child: Plug(
                          plugId: plug.plugId,
                          plugName: plug.plugName,
                          onOff: plug.onOff,
                          runningTime: plug.runningTime,
                          usedPower: plug.usedPower,
                          assignPower: plug.assignPower,
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const PowerEntry(plugId: 0, plugName: 'null'),
          ],
        ),
      ),
    );
  }
}
