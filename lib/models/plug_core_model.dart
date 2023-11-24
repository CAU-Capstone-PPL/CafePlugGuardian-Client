import 'package:cafe_plug_guardian_client/models/time_model.dart';

class PlugCoreModel {
  final String plugName, onOff;
  final TimeModel runningTime;
  final int plugId;
  final double usedPower, assignPower;

  PlugCoreModel.fromJson(Map<String, dynamic> json)
      : plugId = json['plugId'],
        plugName = json['plugName'],
        onOff = json['onOff'],
        runningTime = TimeModel.fromJson(json['runningTime']),
        usedPower = json['usedPower'],
        assignPower = json['assignPower'];
}
