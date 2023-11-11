import 'package:cafe_plug_guardian_client/models/plug_core_model.dart';
import 'package:cafe_plug_guardian_client/screens/alert_screen.dart';
import 'package:cafe_plug_guardian_client/screens/plug_list_screen.dart';
import 'package:cafe_plug_guardian_client/services/api_test.dart';
import 'package:cafe_plug_guardian_client/style.dart';
import 'package:cafe_plug_guardian_client/widgets/plug_widget.dart';
import 'package:cafe_plug_guardian_client/widgets/weekly_power_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  //final Future<List<PlugCoreModel>> plugs = ApiPlug.getPlugs();

  final Future<List<PlugCoreModel>> plugs =
      ApiTest.testGetOnPlugs(); //test code
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
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const AlertScreen()));
            },
            icon: const Icon(Icons.add_alert_outlined),
          ),
        ],
        title: const Text(
          "Cafe Nickname",
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
              future: plugs,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Plug List',
                            style: TextStyle(
                                color: AppColor.text,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          OutlinedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const PlugListScreen(),
                                  ),
                                );
                              },
                              child: const Text(
                                'View All',
                                style: TextStyle(color: AppColor.text),
                              )),
                        ],
                      ),
                      makeList(snapshot),
                    ],
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
            const SizedBox(
              height: 20,
            ),
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
                        width: 500,
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

  SizedBox makeList(AsyncSnapshot<List<PlugCoreModel>> snapshot) {
    return SizedBox(
      height: 170,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: snapshot.data!.length,
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        itemBuilder: (context, index) {
          var plug = snapshot.data![index];
          return Plug(
            plugId: plug.plugId,
            plugName: plug.plugName,
            onOff: plug.onOff,
            runningTime: plug.runningTime,
            usedPower: plug.usedPower,
            assignPower: plug.assignPower,
          );
        },
        separatorBuilder: (context, index) => const SizedBox(width: 20),
      ),
    );
  }
}
