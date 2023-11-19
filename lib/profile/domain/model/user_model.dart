class User {
  final int id;
  final String userFirstName;
  final String userLastName;
  final String userEmail;
  final String? userPhone;
  final String? imageData;

  User({
    required this.id,
    required this.userFirstName,
    required this.userLastName,
    required this.userEmail,
    required this.userPhone,
    required this.imageData,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        userFirstName: json["userFirstName"],
        userLastName: json["userLastName"],
        userEmail: json["userEmail"],
        userPhone: json["userPhone"],
        imageData: json["imageData"],
      );

}