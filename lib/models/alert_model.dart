import 'package:cafe_plug_guardian_client/models/date_time_model.dart';

class AlertModel {
  final int plugOffLogId, plugUseId, plugId;
  final String plugName;
  final DateTimeModel plugOffTime;
  final bool ownerCheck;
  final String toggle;

  AlertModel.fromJson(Map<String, dynamic> json)
      : plugId = json['plugId'],
        plugOffLogId = json['plugOffLogId'],
        plugUseId = json['plugUseId'],
        plugName = json['plugName'],
        plugOffTime = DateTimeModel.fromJson(json['plugOffTime']),
        ownerCheck = json['ownerCheck'],
        toggle = json['toggle'];
}
