import 'package:cafe_plug_guardian_client/models/time_model.dart';

class PlugDetatilModel {
  final int plugId;
  final String plugName, plugDescription;
  final bool useStatus, toggle;
  final TimeModel startTime, runningTime;
  final double usedPower, assignPower, realTimePower;

  PlugDetatilModel(
      {required this.plugId,
      required this.plugName,
      required this.toggle,
      required this.useStatus,
      required this.plugDescription,
      required this.startTime,
      required this.runningTime,
      required this.assignPower,
      required this.realTimePower,
      required this.usedPower});

  PlugDetatilModel.fromJson(Map<String, dynamic> json)
      : plugId = json['plugId'],
        plugName = json['plugName'],
        toggle = json['toggle'],
        useStatus = json['useStatus'],
        plugDescription = json['plugDescription'],
        startTime = TimeModel.fromJson(json['startTime']),
        runningTime = TimeModel.fromJson(json['runningTime']),
        usedPower = json['usedPower'].toDouble(),
        assignPower = json['assignPower'].toDouble(),
        realTimePower = json['realTimePower'].toDouble();
}
