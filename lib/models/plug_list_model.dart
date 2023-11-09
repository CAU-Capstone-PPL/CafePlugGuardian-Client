import 'package:cafe_plug_guardian_client/models/plug_core_model.dart';

class PlugListModel {
  final int total;
  final List<PlugCoreModel> plugs;

  PlugListModel.fromJson(Map<String, dynamic> json)
      : total = json['total'],
        plugs = json['plugs'];
}
