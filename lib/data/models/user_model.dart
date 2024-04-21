class User {
  int id;
  String name;
  String countryCode;
  String phone;
  String email;

  User({
    required this.id,
    required this.name,
    required this.countryCode,
    required this.phone,
    required this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: int.parse(json["id"]),
        name: json["name"],
        countryCode: json["country_code"],
        phone: json["phone"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "country_code": countryCode,
        "phone": phone,
        "email": email,
      };
}
