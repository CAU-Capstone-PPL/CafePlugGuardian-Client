class AlertModel {
  final String plugId, plugName, blockingTime;

  AlertModel.fromJson(Map<String, dynamic> json)
      : plugId = json['plugId'],
        plugName = json['plugName'],
        blockingTime = json['blockingTime'];
}
