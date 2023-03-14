import 'Dash.dart';

class Restaurant {
  late List<Dash> dashList;
  int? id;
  String name;
  String? city;
  String? country;
  String? zipCode;
  String? phone;
  String? image;
  DateTime createdAt;

  Restaurant({
    this.id,
    required this.name,
    this.city,
    this.country,
    this.zipCode,
    this.phone,
    this.image,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'city': city,
      'country': country,
      'zip_code': zipCode,
      'phone': phone,
      'image': image,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  static Restaurant fromMap(Map<String, dynamic> map) {
    return Restaurant(
      id: map['id'],
      name: map['name'],
      city: map['city'],
      country: map['country'],
      zipCode: map['zip_code'],
      phone: map['phone'],
      image: map['image'],
      createdAt: DateTime.parse(map['createdAt']),
    );
  }

  @override
  String toString() {
    return 'Restaurant { id: $id, name: $name, city: $city, country: $country, zipCode: $zipCode, phone: $phone, image: $image, createdAt: $createdAt }';
  }
}
