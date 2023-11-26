import 'package:cafe_plug_guardian_client/models/date_time_model.dart';

class AlertModel {
  final int plugId;
  final String plugName;
  final DateTimeModel blockingTime;
  final bool check;

  AlertModel.fromJson(Map<String, dynamic> json)
      : plugId = json['plugId'],
        plugName = json['plugName'],
        blockingTime = DateTimeModel.fromJson(json['blockingTime']),
        check = json['check'];
}
