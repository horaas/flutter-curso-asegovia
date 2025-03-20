class Product {
  final String id;
  final String title;
  final double price;
  final String description;
  final String slug;
  final int stock;
  final List<String> sizes;
  final String gende;
  final List<String> tags;
  final List<String> images;

  Product(
      {required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.slug,
      required this.stock,
      required this.sizes,
      required this.gende,
      required this.tags,
      required this.images});
}
