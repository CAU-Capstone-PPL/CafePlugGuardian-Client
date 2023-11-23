import 'dart:async';

import 'package:cafe_plug_guardian_client/models/plug_core_model.dart';
import 'package:cafe_plug_guardian_client/provider/plug_core_provider.dart';
import 'package:cafe_plug_guardian_client/screens/plug_connect_screen.dart';
import 'package:cafe_plug_guardian_client/services/api_plug.dart';
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
  late final Future<List<PlugCoreModel>> plugs;

  late Timer _timer;

  @override
  void initState() {
    super.initState();
    context.read<PlugCoreProvider>().updatePlugs();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      context.read<PlugCoreProvider>().updatePlugs();
    });
  }

  void _stopTimer() {
    _timer.cancel();
  }

  @override
  void dispose() {
    _stopTimer();
    //_scrollController.dispose();
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
                        '총 개수: ${context.watch<PlugCoreProvider>().plugs.length}'),
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
                    const SizedBox(
                      width: 10,
                    ),
                    CustomButton(content: '플러그 삭제', onPressed: () {}),
                  ],
                ),
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
                    .plugs
                    .map(
                      (plug) => Plug(
                        plugId: plug.plugId,
                        plugName: plug.plugName,
                        onOff: plug.onOff,
                        runningTime: plug.runningTime,
                        usedPower: plug.usedPower,
                        assignPower: plug.assignPower,
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ), /*FutureBuilder(
          future: plugs,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else if (!snapshot.hasData) {
              return const Center(
                child: Text('No plugs available.'),
              );
            } else if (snapshot.data!.isEmpty) {
              const Center(
                child: BoldText(content: '플러그를 연결하세요'),
              );
            }
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    HeadingText(content: '총 개수: ${snapshot.data!.length}'),
                    Row(
                      children: [
                        CustomButton(
                            content: '플러그 추가',
                            onPressed: () {
                              _stopTimer();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const PlugConnectScreen(),
                                ),
                              ).then((_) {
                                _startTimer();
                              });
                            }),
                        const SizedBox(
                          width: 10,
                        ),
                        CustomButton(content: '플러그 삭제', onPressed: () {}),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: GridView.count(
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    crossAxisCount: 2,
                    childAspectRatio: 1.2,
                    children: snapshot.data!
                        .map(
                          (plug) => Plug(
                            plugId: plug.plugId,
                            plugName: plug.plugName,
                            onOff: plug.onOff,
                            runningTime: plug.runningTime,
                            usedPower: plug.usedPower,
                            assignPower: plug.assignPower,
                          ),
                        )
                        .toList(),
                  ),
                ),
              ],
            );
          },
        ),*/
      ),
    );
  }
}
