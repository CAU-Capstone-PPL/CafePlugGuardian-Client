import 'package:cafe_plug_guardian_client/models/alert_model.dart';
import 'package:cafe_plug_guardian_client/services/api_alert.dart';
import 'package:cafe_plug_guardian_client/services/api_plug.dart';
import 'package:cafe_plug_guardian_client/services/api_test.dart';
import 'package:cafe_plug_guardian_client/style.dart';
import 'package:cafe_plug_guardian_client/widgets/alert_widget.dart';
import 'package:flutter/material.dart';

class AlertScreen extends StatefulWidget {
  const AlertScreen({super.key});

  @override
  State<AlertScreen> createState() => _AlertScreenState();
}

class _AlertScreenState extends State<AlertScreen> {
  late Future<List<AlertModel>> alerts;

  @override
  void initState() {
    super.initState();
    alerts = ApiAlert.getAlertList(1);
    //alerts = ApiTest.testGetAlertList();
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
        child: FutureBuilder(
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
        ),
      ),
    );
  }
}
