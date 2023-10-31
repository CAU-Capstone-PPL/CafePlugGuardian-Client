class PlugCoreModel {
  final String plugName, onOff, startTime, runningTime, assignPower;

  PlugCoreModel.fromJson(Map<String, dynamic> json)
      : plugName = json['plugName'],
        onOff = json['onOff'],
        startTime = json['startTime'],
        runningTime = json['runningTime'],
        assignPower = json['assignPower'];
}
