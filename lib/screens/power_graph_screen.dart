import 'package:cafe_plug_guardian_client/services/api_test.dart';
import 'package:cafe_plug_guardian_client/style.dart';
import 'package:cafe_plug_guardian_client/widgets/weekly_power_widget.dart';
import 'package:flutter/material.dart';

class PowerGraphScreen extends StatefulWidget {
  const PowerGraphScreen({super.key});

  @override
  State<PowerGraphScreen> createState() => _PowerGraphScreenState();
}

class _PowerGraphScreenState extends State<PowerGraphScreen> {
  final Future<List<double>> weeklyPowerData =
      ApiTest.testGetWeeklyPower(); //test code
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: AppColor.background,
        foregroundColor: AppColor.text,
        title: const Text(
          "Power Graph",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColor.text,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            FutureBuilder(
              future: weeklyPowerData,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Power Graph',
                        style: TextStyle(
                            color: AppColor.text,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 300,
                        width: 400,
                        child: WeeklyPowerWidget(weeklyData: snapshot.data!),
                      ),
                    ],
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
