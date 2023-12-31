import 'dart:async';
import 'package:cafe_plug_guardian_client/provider/plug_core_provider.dart';
import 'package:cafe_plug_guardian_client/provider/user_provider.dart';
import 'package:cafe_plug_guardian_client/screens/plug_connect_screen.dart';
import 'package:cafe_plug_guardian_client/screens/plug_detail_screens.dart';
import 'package:cafe_plug_guardian_client/style.dart';
import 'package:cafe_plug_guardian_client/widgets/custom_button_widget.dart';
import 'package:cafe_plug_guardian_client/widgets/plug_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlugListScreen extends StatefulWidget {
  const PlugListScreen({super.key});

  @override
  State<PlugListScreen> createState() => _PlugListScreenState();
}

class _PlugListScreenState extends State<PlugListScreen> {
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    context
        .read<PlugCoreProvider>()
        .updateAllPlugs(context.read<UserProvider>().cafeId!);
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      context
          .read<PlugCoreProvider>()
          .updateAllPlugs(context.read<UserProvider>().cafeId!);
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
        backgroundColor: AppColor.background,
        title: const AppBarText(content: '플러그 관리 페이지'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            _stopTimer();
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                HeadingText(
                    content:
                        '총 개수: ${context.watch<PlugCoreProvider>().allPlugs.length}'),
                Row(
                  children: [
                    CustomButton(
                        content: '플러그 추가',
                        onPressed: () {
                          _stopTimer();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const PlugConnectScreen(),
                            ),
                          ).then((_) {
                            _startTimer();
                          });
                        }),
                    /*const SizedBox(
                      width: 10,
                    ),*/
                    //CustomButton(content: '플러그 삭제', onPressed: () {}),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: context.read<PlugCoreProvider>().allPlugs.isNotEmpty
                  ? ListView.separated(
                      itemCount:
                          context.watch<PlugCoreProvider>().allPlugs.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(height: 16);
                      },
                      itemBuilder: (context, index) {
                        final plug =
                            context.watch<PlugCoreProvider>().allPlugs[index];
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
                      child: TitleText(content: '아직 추가된 플러그가 없습니다.'),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
