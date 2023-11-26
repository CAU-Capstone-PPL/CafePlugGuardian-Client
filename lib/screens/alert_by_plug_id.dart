import 'package:cafe_plug_guardian_client/models/alert_model.dart';
import 'package:cafe_plug_guardian_client/services/api_test.dart';
import 'package:cafe_plug_guardian_client/style.dart';
import 'package:cafe_plug_guardian_client/widgets/alert_widget.dart';
import 'package:flutter/material.dart';

class AlertByPlugIdScreen extends StatefulWidget {
  final int plugId;
  final String plugName;

  const AlertByPlugIdScreen(
      {super.key, required this.plugId, required this.plugName});

  @override
  State<AlertByPlugIdScreen> createState() => _AlertByPlugIdScreenState();
}

class _AlertByPlugIdScreenState extends State<AlertByPlugIdScreen> {
  late Future<List<AlertModel>> alerts;
  @override
  void initState() {
    super.initState();
    alerts = ApiTest.testGetAlertListByPlugId(widget.plugId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: AppBarText(content: '${widget.plugName} 비허용 기기 접속 로그')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: FutureBuilder(
          future: alerts,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.separated(
                itemCount: snapshot.data!.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10), // 예시로 간격을 10으로 설정
                itemBuilder: (context, index) {
                  var alert = snapshot.data![index];
                  return Alert(
                    plugId: alert.plugId,
                    plugName: alert.plugName,
                    blockingTime: alert.blockingTime,
                    check: alert.check,
                  );
                },
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
