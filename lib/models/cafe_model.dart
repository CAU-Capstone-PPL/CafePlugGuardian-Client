class CafeModel {
  final int cafeIndex;
  final int cafeId;
  final String cafeName;

  CafeModel.fromJson(Map<String, dynamic> json)
      : cafeIndex = json['cafeIndex'],
        cafeId = json['cafeId'],
        cafeName = json['cafeName'];
}
