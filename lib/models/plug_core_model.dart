class PlugCoreModel {
  final String plugId, plugName, onOff, runningTime, usedPower, assignPower;

  PlugCoreModel.fromJson(Map<String, dynamic> json)
      : plugId = json['plugId'],
        plugName = json['plugName'],
        onOff = json['onOff'],
        runningTime = json['runningTime'],
        usedPower = json['usedPower'],
        assignPower = json['assignPower'];
}
