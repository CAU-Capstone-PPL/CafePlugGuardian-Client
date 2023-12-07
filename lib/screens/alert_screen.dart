import 'package:cafe_plug_guardian_client/models/alert_model.dart';
import 'package:cafe_plug_guardian_client/provider/alert_provider.dart';
import 'package:cafe_plug_guardian_client/screens/alert_by_plug_id.dart';
import 'package:cafe_plug_guardian_client/screens/plug_detail_screens.dart';
import 'package:cafe_plug_guardian_client/services/api_alert.dart';
import 'package:cafe_plug_guardian_client/services/api_plug.dart';
import 'package:cafe_plug_guardian_client/services/api_test.dart';
import 'package:cafe_plug_guardian_client/style.dart';
import 'package:cafe_plug_guardian_client/widgets/alert_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AlertScreen extends StatefulWidget {
  const AlertScreen({super.key});

  @override
  State<AlertScreen> createState() => _AlertScreenState();
}

class _AlertScreenState extends State<AlertScreen> {
  //late Future<List<AlertModel>> alerts;

  @override
  void initState() {
    super.initState();
    //alerts = ApiAlert.getAlertList(1);
    //alerts = ApiTest.testGetAlertList();
    update();
  }

  void update() {
    context.read<AlertProvider>().updateAllAlert();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: AppBar(
        title: const AppBarText(
          content: '플러그 보호 알람 리스트',
        ),
        backgroundColor: AppColor.background,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: context.watch<AlertProvider>().allAlertList.isNotEmpty
            ? ListView.separated(
                itemCount: context.watch<AlertProvider>().allAlertList.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 30),
                itemBuilder: (context, index) {
                  var alert =
                      context.watch<AlertProvider>().allAlertList[index];
                  return GestureDetector(
                    onTap: () {
                      //관리자용 앱 플러그 차단 로그 확인 완료 Api
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  PlugDetailScreen(id: alert.plugId)));
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AlertByPlugIdScreen(
                                    plugId: alert.plugId,
                                    plugName: alert.plugName,
                                  )));
                    },
                    child: Alert(
                        plugId: alert.plugId,
                        plugName: alert.plugName,
                        plugOffTime: alert.plugOffTime,
                        ownerCheck: alert.ownerCheck,
                        toggle: alert.toggle),
                  );
                },
              )
            : const Center(
                child: TitleText(content: '로그가 없습니다.'),
              ),
        /*FutureBuilder(
          future: alerts,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: TitleText(content: '비허용 기기 연결 알람이 없습니다.'),
              );
            } else if (snapshot.data!.isEmpty) {
              return const Center(
                child: TitleText(content: '비허용 기기 연결 알람이 없습니다.'),
              );
            }

            return ListView.separated(
              itemCount: snapshot.data!.length,
              separatorBuilder: (context, index) => const SizedBox(height: 30),
              itemBuilder: (context, index) {
                var alert = snapshot.data![index];
                return Alert(
                    plugId: alert.plugId,
                    plugName: alert.plugName,
                    plugOffTime: alert.plugOffTime,
                    ownerCheck: alert.ownerCheck,
                    isToggleOn: alert.isToggleOn);
              },
            );
          },
        ),*/
      ),
    );
  }
}
