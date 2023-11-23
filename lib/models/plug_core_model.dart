class PlugCoreModel {
  final String plugName, onOff, runningTime;
  final int plugId;
  final double usedPower, assignPower;

  PlugCoreModel.fromJson(Map<String, dynamic> json)
      : plugId = json['plugId'],
        plugName = json['plugName'],
        onOff = json['onOff'],
        runningTime = json['runningTime'],
        usedPower = json['usedPower'],
        assignPower = json['assignPower'];
}
