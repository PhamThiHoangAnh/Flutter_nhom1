class Product {
  int id;
  String title;
  dynamic price;
  String description;
  String category;
  String image;
  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    // this.image = ''
    required this.image,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] ?? 0, //?? 0 nếu giá trị trả về là null thì gán id = 0
      title:
          json['title'] ??
          '', //?? '' nếu giá trị trả về là null thì gán title = ''
      price:
          json['price'] ??
          0, //?? 0 nếu giá trị trả về là null thì gán price = 0
      description:
          json['description'] ??
          '', //?? '' nếu giá trị trả về là null thì gán description = ''
      category:
          json['category'] ??
          '', //?? '' nếu giá trị trả về là null thì gán category = ''
      image:
          json['image'] ??
          '', //?? '' nếu giá trị trả về là null thì gán image = ''
    );
  }
}
