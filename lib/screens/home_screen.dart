import 'package:cafe_plug_guardian_client/models/plug_core_model.dart';
import 'package:cafe_plug_guardian_client/screens/plug_list_screen.dart';
import 'package:cafe_plug_guardian_client/services/api_plug.dart';
import 'package:cafe_plug_guardian_client/style.dart';
import 'package:cafe_plug_guardian_client/widgets/plug_widget.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  //final Future<List<PlugCoreModel>> plugs = ApiPlug.getPlugs();

  final Future<List<PlugCoreModel>> plugs =
      ApiPlug.testFetchPlugData(); //test code

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.background,
        foregroundColor: AppColor.text,
        title: const Text(
          "카페닉네임들어갈자리",
          style: TextStyle(
            fontSize: 24,
            color: AppColor.text,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: FutureBuilder(
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
                                builder: (context) => const PlugListScreen(),
                              ),
                            );
                          },
                          child: const Text(
                            'View All',
                            style: TextStyle(color: AppColor.text),
                          )),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Expanded(child: makeList(snapshot))
                ],
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

  ListView makeList(AsyncSnapshot<List<PlugCoreModel>> snapshot) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: snapshot.data!.length,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      itemBuilder: (context, index) {
        var plug = snapshot.data![index];
        return Plug(
          plugId: plug.plugId,
          plugName: plug.plugName,
          onOff: plug.onOff,
          startTime: plug.startTime,
          runningTime: plug.runningTime,
          usedPower: plug.usedPower,
          assignPower: plug.assignPower,
        );
      },
      separatorBuilder: (context, index) => const SizedBox(width: 20),
    );
  }
}
