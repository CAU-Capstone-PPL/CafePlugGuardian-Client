import 'package:cafe_plug_guardian_client/models/plug_detail_model.dart';
import 'package:cafe_plug_guardian_client/services/api_test.dart';
import 'package:cafe_plug_guardian_client/style.dart';
import 'package:flutter/material.dart';

class PlugDetailScreen extends StatefulWidget {
  final String id;
  const PlugDetailScreen({super.key, required this.id});

  @override
  State<PlugDetailScreen> createState() => _PlugDetailScreenState();
}

class _PlugDetailScreenState extends State<PlugDetailScreen> {
  late Future<PlugDetatilModel> plug;

  @override
  void initState() {
    super.initState();
    plug = ApiTest.testGetPlugById(widget.id);
    //plug = ApiPlug.getPlugById(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: FutureBuilder(
          future: plug,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Container(
                      width: 400,
                      height: 300,
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColor.text, width: 1.5),
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
                              Text(
                                '플러그 ID: ${snapshot.data!.plugId}',
                                style: const TextStyle(fontSize: 16),
                              ),
                              Text(
                                snapshot.data!.plugName,
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Image(
                                  image: AssetImage('assets/smartPlug.png'),
                                  width: 100,
                                ),
                              ),
                              Text(
                                snapshot.data!.onOff,
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                child: snapshot.data!.onOff == 'On'
                                    ? const Text('Off')
                                    : const Text('On'),
                              ),
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
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const Text(
                                '누적 전력소모량',
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                snapshot.data!.usedPower,
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              const Text(
                                '할당된 전력량',
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                snapshot.data!.assignPower,
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              const Text(
                                '현재 전력 소모량',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                snapshot.data!.realTimePower,
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              const Text(
                                '플러그 사용 시작 시각',
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                snapshot.data!.startTime,
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              const Text(
                                '플러그 사용 시간',
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                snapshot.data!.runningTime,
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      child: const Text('알람 자리'),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      child: const Text('그래프 자리'),
                    ),
                  ],
                ),
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
