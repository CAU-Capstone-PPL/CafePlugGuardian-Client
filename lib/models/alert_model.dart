import 'package:cafe_plug_guardian_client/models/date_time_model.dart';

class AlertModel {
  final int plugId;
  final String plugName;
  final DateTimeModel plugOffTime;
  final bool ownerCheck, isToggleOn;

  AlertModel.fromJson(Map<String, dynamic> json)
      : plugId = json['plugId'],
        plugName = json['plugName'],
        plugOffTime = DateTimeModel.fromJson(json['plugOffTime']),
        ownerCheck = json['ownerCheck'],
        isToggleOn = json['isToggleOn'];
}
