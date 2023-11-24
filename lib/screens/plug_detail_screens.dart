import 'dart:async';
import 'package:cafe_plug_guardian_client/models/alert_model.dart';
import 'package:cafe_plug_guardian_client/provider/plug_detail_provider.dart';
import 'package:cafe_plug_guardian_client/screens/alert_by_plug_id.dart';
import 'package:cafe_plug_guardian_client/services/api_plug.dart';
import 'package:cafe_plug_guardian_client/services/api_test.dart';
import 'package:cafe_plug_guardian_client/style.dart';
import 'package:cafe_plug_guardian_client/widgets/custom_button_widget.dart';
import 'package:cafe_plug_guardian_client/widgets/page_entry_button_widget.dart';
import 'package:cafe_plug_guardian_client/widgets/plug_power_info.dart';
import 'package:cafe_plug_guardian_client/widgets/power_entry_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlugDetailScreen extends StatefulWidget {
  final int id;
  const PlugDetailScreen({super.key, required this.id});

  @override
  State<PlugDetailScreen> createState() => _PlugDetailScreenState();
}

class _PlugDetailScreenState extends State<PlugDetailScreen> {
  late Future<List<AlertModel>> alerts;
  late String plugOnOff;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
    alerts = ApiTest.tsetGetAlertList();
    //plug = ApiPlug.getPlugById(widget.id);
  }

  void _startTimer() {
    context.read<PlugDetailProvider>().updatePlug(widget.id);
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      context.read<PlugDetailProvider>().updatePlug(widget.id);
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
        title: const AppBarText(content: '플러그 상세 페이지'),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HeadingText(content: '플러그 정보'),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 400,
                    height: 350,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColor.text, width: 1.5),
                      color: AppColor.background,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          offset: const Offset(5, 5),
                          color: Colors.black.withOpacity(0.3),
                        )
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            NormalText(content: '플러그 ID: ${widget.id}'),
                            BoldText(
                                content: context
                                    .read<PlugDetailProvider>()
                                    .plug!
                                    .plugName),
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Image(
                                image: AssetImage('assets/smartPlug.png'),
                                width: 100,
                              ),
                            ),
                            BoldText(
                                content: context
                                    .watch<PlugDetailProvider>()
                                    .plug!
                                    .onOff),
                            CustomButton(
                                content: context
                                            .watch<PlugDetailProvider>()
                                            .plug!
                                            .onOff ==
                                        'On'
                                    ? 'Off'
                                    : 'On',
                                onPressed: () {
                                  if (context
                                          .watch<PlugDetailProvider>()
                                          .plug!
                                          .onOff ==
                                      'On') {
                                    ApiPlug.patchPlugOff(widget.id);
                                  } else {
                                    ApiPlug.patchPlugOn(widget.id);
                                  }
                                }),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              context
                                  .read<PlugDetailProvider>()
                                  .plug!
                                  .plugDescription,
                              style: const TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        PlugPowerInfomattion(
                          assignPower: context
                              .watch<PlugDetailProvider>()
                              .plug!
                              .assignPower,
                          usedPower: context
                              .watch<PlugDetailProvider>()
                              .plug!
                              .usedPower,
                          realTimePower: context
                              .watch<PlugDetailProvider>()
                              .plug!
                              .realTimePower,
                          startTime: context
                              .watch<PlugDetailProvider>()
                              .plug!
                              .startTime
                              .toString(),
                          runningTime: context
                              .watch<PlugDetailProvider>()
                              .plug!
                              .runningTime
                              .toString(),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  PowerEntry(
                      plugId: widget.id,
                      plugName:
                          context.read<PlugDetailProvider>().plug!.plugName),
                  const SizedBox(
                    height: 20,
                  ),
                  PageEntryButton(
                    content: '비정상 접근 로그',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              AlertByPlugIdScreen(plugId: widget.id),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
