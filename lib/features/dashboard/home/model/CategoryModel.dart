class CategoryModel {
  final String image;
  final String title;
  final String description;
  final double price;
  final int quantity;

  CategoryModel({
    required this.image,
    required this.title,
    this.description = '',
    this.price = 0,
    this.quantity = 1, // Default quantity is 1
  });
}
