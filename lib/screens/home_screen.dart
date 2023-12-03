import 'dart:async';
import 'package:cafe_plug_guardian_client/models/time_model.dart';
import 'package:cafe_plug_guardian_client/provider/plug_core_provider.dart';
import 'package:cafe_plug_guardian_client/provider/user_provider.dart';
import 'package:cafe_plug_guardian_client/screens/alert_screen.dart';
import 'package:cafe_plug_guardian_client/screens/plug_detail_screens.dart';
import 'package:cafe_plug_guardian_client/screens/plug_list_screen.dart';
import 'package:cafe_plug_guardian_client/screens/user_manage_screen.dart';
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
        automaticallyImplyLeading: false,
        centerTitle: false,
        backgroundColor: AppColor.background,
        foregroundColor: AppColor.text,
        actions: [
          IconButton(
            onPressed: () {
              _stopTimer();
              Navigator.of(context)
                  .push(MaterialPageRoute(
                      builder: (context) => const AlertScreen()))
                  .then((_) {
                _startTimer();
              });
            },
            icon: const Icon(
              Icons.add_alert_outlined,
              size: 40,
            ),
          ),
          IconButton(
            onPressed: () {
              _stopTimer();
              Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const UserManageScreen()))
                  .then((_) {
                _startTimer();
              });
            },
            icon: const Icon(
              Icons.settings,
              size: 40,
            ),
          ),
          IconButton(
            onPressed: () {
              context.read<UserProvider>().logout();
              Navigator.popUntil(context, (route) => route.isFirst);
            },
            icon: const Icon(
              Icons.logout,
              size: 40,
            ),
          ),
        ],
        title: AppBarText(
          content: '${context.read<UserProvider>().user!.userName} 님',
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
                  content: '손님이 사용 중인 Plugs',
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
              child: context.read<PlugCoreProvider>().onPlugs.isNotEmpty
                  ? ListView.separated(
                      itemCount:
                          context.watch<PlugCoreProvider>().onPlugs.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(height: 16);
                      },
                      itemBuilder: (context, index) {
                        final plug =
                            context.watch<PlugCoreProvider>().onPlugs[index];
                        return GestureDetector(
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
                            toggle: plug.toggle,
                            useStatus: plug.useStatus,
                            runningTime: plug.runningTime,
                            usedPower: plug.usedPower,
                            assignPower: plug.assignPower,
                          ),
                        );
                      },
                    )
                  : const Center(
                      child: TitleText(content: '아직 손님이 사용 중인 플러그가 없습니다.'),
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
