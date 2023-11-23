class PlugDetatilModel {
  String plugName, onOff, plugDescription;
  String startTime = '', runningTime = '';

  int plugId;
  double usedPower = 0, assignPower = 0, realTimePower = 0;

  PlugDetatilModel(
      {required this.plugId,
      required this.plugName,
      required this.onOff,
      required this.plugDescription});

  PlugDetatilModel.fromJson(Map<String, dynamic> json)
      : plugId = json['plugId'],
        plugName = json['plugName'],
        onOff = json['onOff'],
        startTime = json['startTime'],
        runningTime = json['runningTime'],
        usedPower = json['usedPower'],
        assignPower = json['assignPower'],
        plugDescription = json['plugDescription'],
        realTimePower = json['realTimePower'];
}
