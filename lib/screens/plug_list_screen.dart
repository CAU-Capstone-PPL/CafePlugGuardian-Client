import 'package:cafe_plug_guardian_client/models/plug_core_model.dart';
import 'package:cafe_plug_guardian_client/services/api_test.dart';
import 'package:cafe_plug_guardian_client/widgets/plug_widget.dart';
import 'package:flutter/material.dart';

class PlugListScreen extends StatefulWidget {
  const PlugListScreen({super.key});

  @override
  State<PlugListScreen> createState() => _PlugListScreenState();
}

class _PlugListScreenState extends State<PlugListScreen> {
  late final Future<List<PlugCoreModel>> plugs;

  @override
  void initState() {
    super.initState();
    plugs = ApiTest.testGetOnPlugs(); // Replace with your API call
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('플러그 관리 페이지'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('플러그 총 개수'),
                Text('플러그 추가'),
                Text('플러그 삭제'),
              ],
            ),
            const SizedBox(height: 20),
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
                } else {
                  return Expanded(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 15.0,
                        mainAxisSpacing: 12.0,
                      ),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        final plug = snapshot.data![index];
                        return Plug(
                          plugId: plug.plugId,
                          plugName: plug.plugName,
                          onOff: plug.onOff,
                          runningTime: plug.runningTime,
                          usedPower: plug.usedPower,
                          assignPower: plug.assignPower,
                        );
                      },
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
