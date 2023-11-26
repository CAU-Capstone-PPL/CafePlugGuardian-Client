import 'package:cafe_plug_guardian_client/models/date_model.dart';
import 'package:cafe_plug_guardian_client/models/time_model.dart';

class DateTimeModel {
  final DateModel date;
  final TimeModel time;

  DateTimeModel({required this.date, required this.time});

  DateTimeModel.fromJson(Map<String, dynamic> json)
      : date = DateModel.fromJson(json['date']),
        time = TimeModel.fromJson(json['time']);
}
