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
  });

  factory Bicycle.fromJson(Map<String, dynamic> json) => Bicycle(
        id: json["id"],
        bicycleName: json["bicycleName"],
        bicycleDescription: json["bicycleDescription"],
        bicyclePrice: json["bicyclePrice"],
        bicycleSize: json["bicycleSize"],
        bicycleModel: json["bicycleModel"],
        imageData: json["imageData"],
        latitude: json["latitudeData"],
        longitude: json["longitudeData"],
      );

  factory Bicycle.fromJsonUser(Map<String, dynamic> json) => Bicycle(
        id: json["bicycles"]["id"],
        bicycleName: json["bicycles"]["bicycleName"],
        bicycleDescription: json["bicycles"]["bicycleDescription"],
        bicyclePrice: json["bicycles"]["bicyclePrice"],
        bicycleSize: json["bicycles"]["bicycleSize"],
        bicycleModel: json["bicycles"]["bicycleModel"],
        imageData: json["bicycles"]["imageData"],
        latitude: json["bicycles"]["latitude"],
        longitude: json["bicycles"]["longitude"],
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
      };
}
