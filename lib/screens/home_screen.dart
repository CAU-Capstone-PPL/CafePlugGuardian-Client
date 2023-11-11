import 'package:cafe_plug_guardian_client/models/plug_core_model.dart';
import 'package:cafe_plug_guardian_client/screens/alert_screen.dart';
import 'package:cafe_plug_guardian_client/screens/plug_list_screen.dart';
import 'package:cafe_plug_guardian_client/services/api_test.dart';
import 'package:cafe_plug_guardian_client/style.dart';
import 'package:cafe_plug_guardian_client/widgets/plug_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  //final Future<List<PlugCoreModel>> plugs = ApiPlug.getPlugs();

  final Future<List<PlugCoreModel>> plugs =
      ApiTest.testGetOnPlugs(); //test code

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
            icon: const Icon(
              Icons.add_alert_outlined,
              size: 40,
            ),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'ON Plug List',
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
                  ),
                ),
              ],
            ),
            FutureBuilder(
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
                }
                return Expanded(
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
                );
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: AppColor.text, width: 1.5),
                borderRadius: BorderRadius.circular(10),
                color: AppColor.background,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 2,
                    offset: const Offset(5, 5),
                    color: Colors.black.withOpacity(0.3),
                  ),
                ],
              ),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total Power Graph',
                      style: TextStyle(
                        color: AppColor.text,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(
                      Icons.chevron_right_rounded,
                      size: 30,
                      color: AppColor.text,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
