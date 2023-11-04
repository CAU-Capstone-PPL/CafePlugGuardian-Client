import 'package:cafe_plug_guardian_client/models/plug_detail_model.dart';
import 'package:cafe_plug_guardian_client/services/api_plug.dart';
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
    plug = ApiPlug.testFetchPlugDetailById(widget.id);
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
              return Column(
                children: [
                  Text(snapshot.data!.plugId),
                  Text(snapshot.data!.plugName),
                  Text(snapshot.data!.onOff),
                  Text(snapshot.data!.startTime),
                  Text(snapshot.data!.runningTime),
                  Text(snapshot.data!.usedPower),
                  Text(snapshot.data!.assignPower),
                  Text(snapshot.data!.plugDescription),
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
}
