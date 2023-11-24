class TimeModel {
  final int hours, minutes;

  TimeModel({required this.hours, required this.minutes});

  TimeModel.fromJson(Map<String, dynamic> json)
      : hours = json['hours'],
        minutes = json['minutes'];
}
