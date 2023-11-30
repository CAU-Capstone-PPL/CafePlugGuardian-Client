import 'package:cafe_plug_guardian_client/models/time_model.dart';

class PlugCoreModel {
  final String plugName;
  final bool toggle;
  final bool useStatus;
  final TimeModel runningTime;
  final int plugId;
  final double usedPower, assignPower;

  PlugCoreModel.fromJson(Map<String, dynamic> json)
      : plugId = json['plugId'],
        plugName = json['plugName'],
        toggle = json['toggle'],
        useStatus = json['useStatus'],
        runningTime = TimeModel.fromJson(json['runningTime']),
        usedPower = json['usedPower'].toDouble(),
        assignPower = json['assignPower'].toDouble();
}
