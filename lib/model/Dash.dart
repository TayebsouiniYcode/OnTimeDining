import 'Category.dart';
import 'DashItem.dart';

class Dash {
  final int id;
  final String title;
  final String description;
  final double price;
  final String image;
  final int categoryId;

  Dash({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.image,
    required this.categoryId,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'price': price,
      'image': image,
      'categoryId': categoryId,
    };
  }

  factory Dash.fromMap(Map<String, dynamic>? map) {
    if (map == null) {
      return Dash(
          id: -1,
          title: '',
          description: '',
          categoryId: -1,
          price: 00.00,
          image: '');
    }
    return Dash(
        id: map['id'] ?? '',
        title: map['title'] ?? '',
        description: map['description'] ?? '',
        categoryId: map['categoryId'] ?? '',
        price: map['price'] ?? '',
        image: map['image'] ?? '');
  }

  @override
  String toString() {
    return 'Dash { id : $id, title: $title, description: $description, price: $price, categoryId : $categoryId, image name : $image}';
  }
}
