import 'package:cafe_plug_guardian_client/models/alert_model.dart';
import 'package:cafe_plug_guardian_client/models/plug_detail_model.dart';
import 'package:cafe_plug_guardian_client/screens/alert_by_plug_id.dart';
import 'package:cafe_plug_guardian_client/services/api_plug.dart';
import 'package:cafe_plug_guardian_client/services/api_test.dart';
import 'package:cafe_plug_guardian_client/style.dart';
import 'package:cafe_plug_guardian_client/widgets/custom_button_widget.dart';
import 'package:cafe_plug_guardian_client/widgets/page_entry_button_widget.dart';
import 'package:cafe_plug_guardian_client/widgets/power_entry_widget.dart';
import 'package:flutter/material.dart';

class PlugDetailScreen extends StatefulWidget {
  final int id;
  const PlugDetailScreen({super.key, required this.id});

  @override
  State<PlugDetailScreen> createState() => _PlugDetailScreenState();
}

class _PlugDetailScreenState extends State<PlugDetailScreen> {
  late Future<PlugDetatilModel> plug;
  late Future<List<AlertModel>> alerts;
  late String plugOnOff;

  @override
  void initState() {
    super.initState();
    plug = ApiTest.testGetPlugById(widget.id);
    alerts = ApiTest.tsetGetAlertList();
    //plug = ApiPlug.getPlugById(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: AppBar(
        backgroundColor: AppColor.background,
        title: const AppBarText(content: '플러그 상세 페이지'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FutureBuilder(
              future: plug,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Padding(
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
                          height: 300,
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: AppColor.text, width: 1.5),
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
                                children: [
                                  NormalText(
                                      content:
                                          '플러그 ID: ${snapshot.data!.plugId}'),
                                  BoldText(content: snapshot.data!.plugName),
                                  const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Image(
                                      image: AssetImage('assets/smartPlug.png'),
                                      width: 100,
                                    ),
                                  ),
                                  BoldText(content: snapshot.data!.onOff),
                                  CustomButton(
                                      content: snapshot.data!.onOff == 'On'
                                          ? 'Off'
                                          : 'On',
                                      onPressed: () {
                                        if (snapshot.data!.onOff == 'On') {
                                          ApiPlug.patchPlugOff(
                                              snapshot.data!.plugId);
                                        } else {
                                          ApiPlug.patchPlugOn(
                                              snapshot.data!.plugId);
                                        }
                                      }),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    snapshot.data!.plugDescription,
                                    style: const TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  const NormalText(content: '누적 전력소모량'),
                                  TitleText(
                                      content: '${snapshot.data!.usedPower} W'),
                                  const NormalText(content: '할당된 전력량'),
                                  TitleText(
                                      content:
                                          '${snapshot.data!.assignPower} W'),
                                  const NormalText(content: '현재 전력 소모량'),
                                  TitleText(
                                      content:
                                          '${snapshot.data!.realTimePower} W'),
                                  const NormalText(content: '플러그 사용 시작 시각'),
                                  TitleText(content: snapshot.data!.startTime),
                                  const NormalText(content: '플러그 사용 시간'),
                                  TitleText(
                                      content:
                                          '${snapshot.data!.runningTime} h'),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        PowerEntry(
                            plugId: snapshot.data!.plugId,
                            plugName: snapshot.data!.plugName),
                        const SizedBox(
                          height: 20,
                        ),
                        PageEntryButton(
                            content: '비정상 접근 로그',
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AlertByPlugIdScreen(
                                      plugId: snapshot.data!.plugId),
                                ),
                              );
                            })
                      ],
                    ),
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
