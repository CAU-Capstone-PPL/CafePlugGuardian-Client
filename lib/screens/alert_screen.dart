import 'package:cafe_plug_guardian_client/models/alert_model.dart';
import 'package:cafe_plug_guardian_client/services/api_plug.dart';
import 'package:cafe_plug_guardian_client/style.dart';
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
    alerts = ApiPlug.tsetGetAlertList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        backgroundColor: AppColor.background,
        foregroundColor: AppColor.background,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: FutureBuilder(
            future: alerts,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    for (var alert in snapshot.data!)
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColor.background,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 5,
                              offset: const Offset(5, 5),
                              color: Colors.black.withOpacity(0.1),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 20,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${alert.plugName}에서 비정상적인 전자기기가 ${alert.blockingTime}에 감지되었습니다.',
                                style: const TextStyle(
                                  color: AppColor.text,
                                  fontSize: 8,
                                ),
                              ),
                              const Icon(
                                Icons.chevron_right_rounded,
                                color: AppColor.main,
                              ),
                            ],
                          ),
                        ),
                      )
                  ],
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ),
    );
  }
}
