class Category {
  final int id;
  final String title;
  final String description;
  final String image;

  Category({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'image': image,
    };
  }

  factory Category.fromMap(Map<String, dynamic>? map) {
    if (map == null) {
      return Category(id: -1, title: '', description: '', image: '');
    }

    return Category(
        id: map['id'] ?? '',
        title: map['title'] ?? '',
        description: map['description'] ?? '',
        image: map['image'] ?? '');
  }

  @override
  String toString() {
    return 'Category { id: $id, title: $title, description: $description, image name : $image}';
  }
}
