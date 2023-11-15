class Bicycle {
  final int id;
  final String bicycleName;
  final String bicycleDescription;
  final double bicyclePrice;
  final String bicycleSize;
  final String bicycleModel;
  final String imageData;
  final double latitude;
  final double longitude;
  final int userId;

  Bicycle({
    required this.id,
    required this.bicycleName,
    required this.bicycleDescription,
    required this.bicyclePrice,
    required this.bicycleSize,
    required this.bicycleModel,
    required this.imageData,
    required this.latitude,
    required this.longitude,
    required this.userId,
  });

  factory Bicycle.fromJson(Map<String, dynamic> json) => Bicycle(
        id: json["id"],
        bicycleName: json["bicycleName"],
        bicycleDescription: json["bicycleDescription"],
        bicyclePrice: json["bicyclePrice"],
        bicycleSize: json["bicycleSize"],
        bicycleModel: json["bicycleModel"],
        imageData: json["imageData"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        userId: json["user"]["id"],
      );

  factory Bicycle.fromMap(Map<String, dynamic> map) => Bicycle(
        id: map['id'],
        bicycleName: map['bicycleName'],
        bicycleDescription: map['bicycleDescription'],
        bicyclePrice: map['bicyclePrice'],
        bicycleSize: map['bicycleSize'],
        bicycleModel: map['bicycleModel'],
        imageData: map['imageData'],
        latitude: map['latitude'],
        longitude: map['longitude'],
        userId: map['userId'],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "bicycleName": bicycleName,
        "bicycleDescription": bicycleDescription,
        "bicyclePrice": bicyclePrice,
        "bicycleSize": bicycleSize,
        "bicycleModel": bicycleModel,
        "imageData": imageData,
        "latitude": latitude,
        "longitude": longitude,
        "userId": userId,
      };
}
